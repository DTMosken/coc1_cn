package lime.math._Matrix3
{
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime.math.CairoMatrix3;
   import lime.math.Rectangle;
   import lime.math.Vector2;
   import lime.math.Vector4;
   import lime.utils.ArrayBufferView;
   import lime.utils.TAError;
   
   public final class Matrix3_Impl_
   {
      
      public function Matrix3_Impl_()
      {
      }
      
      public static function _new(param1:Number = 1, param2:Number = 0, param3:Number = 0, param4:Number = 1, param5:Number = 0, param6:Number = 0) : ArrayBufferView
      {
         var _loc13_:* = null as ArrayBufferView;
         var _loc14_:* = null as ArrayBufferView;
         var _loc15_:* = null as Array;
         var _loc16_:* = null as Bytes;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:Bytes = null;
         var _loc9_:Array = [param1,param2,0,param3,param4,0,param5,param6,1];
         var _loc10_:Vector.<Number> = null;
         var _loc11_:ArrayBufferView = null;
         var _loc12_:Object = null;
         if(_loc7_ != null)
         {
            _loc13_ = new ArrayBufferView(_loc7_,8);
         }
         else if(_loc9_ != null)
         {
            _loc14_ = new ArrayBufferView(0,8);
            _loc14_.byteOffset = 0;
            _loc14_.length = int(_loc9_.length);
            _loc14_.byteLength = _loc14_.length * _loc14_.bytesPerElement;
            _loc14_.buffer = Bytes.alloc(_loc14_.byteLength);
            _loc14_.copyFromArray(_loc9_);
            _loc13_ = _loc14_;
         }
         else if(_loc10_ != null)
         {
            _loc14_ = new ArrayBufferView(0,8);
            _loc15_ = _loc10_.__array;
            _loc14_.byteOffset = 0;
            _loc14_.length = int(_loc15_.length);
            _loc14_.byteLength = _loc14_.length * _loc14_.bytesPerElement;
            _loc14_.buffer = Bytes.alloc(_loc14_.byteLength);
            _loc14_.copyFromArray(_loc15_);
            _loc13_ = _loc14_;
         }
         else if(_loc11_ != null)
         {
            _loc14_ = new ArrayBufferView(0,8);
            _loc16_ = _loc11_.buffer;
            _loc17_ = _loc11_.length;
            _loc18_ = _loc11_.byteOffset;
            _loc19_ = _loc11_.bytesPerElement;
            _loc20_ = _loc14_.bytesPerElement;
            if(_loc11_.type != _loc14_.type)
            {
               throw Exception.thrown("unimplemented");
            }
            _loc21_ = _loc16_.length;
            _loc22_ = _loc21_ - _loc18_;
            _loc14_.buffer = Bytes.alloc(_loc22_);
            _loc14_.buffer.blit(0,_loc16_,_loc18_,_loc22_);
            _loc14_.byteLength = _loc14_.bytesPerElement * _loc17_;
            _loc14_.byteOffset = 0;
            _loc14_.length = _loc17_;
            _loc13_ = _loc14_;
         }
         else
         {
            if(_loc8_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float32Array");
            }
            _loc14_ = new ArrayBufferView(0,8);
            _loc17_ = 0;
            if(_loc17_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc17_ % _loc14_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc18_ = _loc8_.length;
            _loc19_ = _loc14_.bytesPerElement;
            _loc20_ = _loc18_;
            if(_loc12_ == null)
            {
               _loc20_ = _loc18_ - _loc17_;
               if(int(_loc18_ % _loc14_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(_loc20_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            else
            {
               _loc20_ = _loc12_ * _loc14_.bytesPerElement;
               _loc21_ = _loc17_ + _loc20_;
               if(_loc21_ > _loc18_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc14_.buffer = _loc8_;
            _loc14_.byteOffset = _loc17_;
            _loc14_.byteLength = _loc20_;
            _loc14_.length = int(_loc20_ / _loc14_.bytesPerElement);
            _loc13_ = _loc14_;
         }
         return _loc13_;
      }
      
      public static function clone(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         var _loc3_:Number = _loc2_.b.readFloat();
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 4;
         var _loc5_:Number = _loc4_.b.readFloat();
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 12;
         var _loc7_:Number = _loc6_.b.readFloat();
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 16;
         var _loc9_:Number = _loc8_.b.readFloat();
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 24;
         var _loc11_:Number = _loc10_.b.readFloat();
         var _loc12_:Bytes = param1.buffer;
         _loc12_.b.position = param1.byteOffset + 28;
         return Matrix3_Impl_._new(_loc3_,_loc5_,_loc7_,_loc9_,_loc11_,_loc12_.b.readFloat());
      }
      
      public static function concat(param1:ArrayBufferView, param2:ArrayBufferView) : void
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset;
         var _loc4_:Number = _loc3_.b.readFloat();
         var _loc5_:Bytes = param2.buffer;
         _loc5_.b.position = param2.byteOffset;
         var _loc6_:Number = _loc4_ * _loc5_.b.readFloat();
         var _loc7_:Bytes = param1.buffer;
         _loc7_.b.position = param1.byteOffset + 4;
         var _loc8_:Number = _loc7_.b.readFloat();
         var _loc9_:Bytes = param2.buffer;
         _loc9_.b.position = param2.byteOffset + 12;
         var _loc10_:Number = _loc6_ + _loc8_ * _loc9_.b.readFloat();
         var _loc11_:Bytes = param1.buffer;
         _loc11_.b.position = param1.byteOffset;
         var _loc12_:Number = _loc11_.b.readFloat();
         var _loc13_:Bytes = param2.buffer;
         _loc13_.b.position = param2.byteOffset + 4;
         var _loc14_:Number = _loc12_ * _loc13_.b.readFloat();
         var _loc15_:Bytes = param1.buffer;
         _loc15_.b.position = param1.byteOffset + 4;
         var _loc16_:Number = _loc15_.b.readFloat();
         var _loc17_:Bytes = param2.buffer;
         _loc17_.b.position = param2.byteOffset + 16;
         var _loc18_:Number = _loc14_ + _loc16_ * _loc17_.b.readFloat();
         var _loc19_:Bytes = param1.buffer;
         _loc19_.b.position = param1.byteOffset + 4;
         _loc19_.b.writeFloat(_loc18_);
         _loc11_ = param1.buffer;
         _loc11_.b.position = param1.byteOffset;
         _loc11_.b.writeFloat(_loc10_);
         _loc11_ = param1.buffer;
         _loc11_.b.position = param1.byteOffset + 12;
         _loc12_ = _loc11_.b.readFloat();
         _loc13_ = param2.buffer;
         _loc13_.b.position = param2.byteOffset;
         _loc14_ = _loc12_ * _loc13_.b.readFloat();
         _loc15_ = param1.buffer;
         _loc15_.b.position = param1.byteOffset + 16;
         _loc16_ = _loc15_.b.readFloat();
         _loc17_ = param2.buffer;
         _loc17_.b.position = param2.byteOffset + 12;
         _loc18_ = _loc14_ + _loc16_ * _loc17_.b.readFloat();
         _loc19_ = param1.buffer;
         _loc19_.b.position = param1.byteOffset + 12;
         var _loc20_:Number = _loc19_.b.readFloat();
         var _loc21_:Bytes = param2.buffer;
         _loc21_.b.position = param2.byteOffset + 4;
         var _loc22_:Number = _loc20_ * _loc21_.b.readFloat();
         var _loc23_:Bytes = param1.buffer;
         _loc23_.b.position = param1.byteOffset + 16;
         var _loc24_:Number = _loc23_.b.readFloat();
         var _loc25_:Bytes = param2.buffer;
         _loc25_.b.position = param2.byteOffset + 16;
         var _loc26_:Number = _loc22_ + _loc24_ * _loc25_.b.readFloat();
         var _loc27_:Bytes = param1.buffer;
         _loc27_.b.position = param1.byteOffset + 16;
         _loc27_.b.writeFloat(_loc26_);
         _loc19_ = param1.buffer;
         _loc19_.b.position = param1.byteOffset + 12;
         _loc19_.b.writeFloat(_loc18_);
         _loc19_ = param1.buffer;
         _loc19_.b.position = param1.byteOffset + 24;
         _loc20_ = _loc19_.b.readFloat();
         _loc21_ = param2.buffer;
         _loc21_.b.position = param2.byteOffset;
         _loc22_ = _loc20_ * _loc21_.b.readFloat();
         _loc23_ = param1.buffer;
         _loc23_.b.position = param1.byteOffset + 28;
         _loc24_ = _loc23_.b.readFloat();
         _loc25_ = param2.buffer;
         _loc25_.b.position = param2.byteOffset + 12;
         _loc26_ = _loc22_ + _loc24_ * _loc25_.b.readFloat();
         _loc27_ = param2.buffer;
         _loc27_.b.position = param2.byteOffset + 24;
         var _loc28_:Number = _loc26_ + _loc27_.b.readFloat();
         var _loc29_:Bytes = param1.buffer;
         _loc29_.b.position = param1.byteOffset + 24;
         var _loc30_:Number = _loc29_.b.readFloat();
         var _loc31_:Bytes = param2.buffer;
         _loc31_.b.position = param2.byteOffset + 4;
         var _loc32_:Number = _loc30_ * _loc31_.b.readFloat();
         var _loc33_:Bytes = param1.buffer;
         _loc33_.b.position = param1.byteOffset + 28;
         var _loc34_:Number = _loc33_.b.readFloat();
         var _loc35_:Bytes = param2.buffer;
         _loc35_.b.position = param2.byteOffset + 16;
         var _loc36_:Number = _loc32_ + _loc34_ * _loc35_.b.readFloat();
         var _loc37_:Bytes = param2.buffer;
         _loc37_.b.position = param2.byteOffset + 28;
         var _loc38_:Number = _loc36_ + _loc37_.b.readFloat();
         var _loc39_:Bytes = param1.buffer;
         _loc39_.b.position = param1.byteOffset + 28;
         _loc39_.b.writeFloat(_loc38_);
         _loc29_ = param1.buffer;
         _loc29_.b.position = param1.byteOffset + 24;
         _loc29_.b.writeFloat(_loc28_);
      }
      
      public static function copyColumnFrom(param1:ArrayBufferView, param2:int, param3:Vector4) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = null as Bytes;
         if(param2 > 2)
         {
            throw Exception.thrown("Column " + param2 + " out of bounds (2)");
         }
         if(param2 == 0)
         {
            _loc4_ = param3.x;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.y;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 4;
            _loc5_.b.writeFloat(_loc4_);
         }
         else if(param2 == 1)
         {
            _loc4_ = param3.x;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 12;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.y;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 16;
            _loc5_.b.writeFloat(_loc4_);
         }
         else
         {
            _loc4_ = param3.x;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 24;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.y;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 28;
            _loc5_.b.writeFloat(_loc4_);
         }
      }
      
      public static function copyColumnTo(param1:ArrayBufferView, param2:int, param3:Vector4) : void
      {
         var _loc4_:* = null as Bytes;
         var _loc5_:* = null as Bytes;
         if(param2 > 2)
         {
            throw Exception.thrown("Column " + param2 + " out of bounds (2)");
         }
         if(param2 == 0)
         {
            _loc4_ = param1.buffer;
            _loc4_.b.position = param1.byteOffset;
            param3.x = _loc4_.b.readFloat();
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 4;
            param3.y = _loc5_.b.readFloat();
            param3.z = 0;
         }
         else if(param2 == 1)
         {
            _loc4_ = param1.buffer;
            _loc4_.b.position = param1.byteOffset + 12;
            param3.x = _loc4_.b.readFloat();
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 16;
            param3.y = _loc5_.b.readFloat();
            param3.z = 0;
         }
         else
         {
            _loc4_ = param1.buffer;
            _loc4_.b.position = param1.byteOffset + 24;
            param3.x = _loc4_.b.readFloat();
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 28;
            param3.y = _loc5_.b.readFloat();
            param3.z = 1;
         }
      }
      
      public static function copyFrom(param1:ArrayBufferView, param2:ArrayBufferView) : void
      {
         var _loc3_:Bytes = param2.buffer;
         _loc3_.b.position = param2.byteOffset;
         var _loc4_:Number = _loc3_.b.readFloat();
         var _loc5_:Bytes = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         _loc5_.b.writeFloat(_loc4_);
         _loc3_ = param2.buffer;
         _loc3_.b.position = param2.byteOffset + 4;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 4;
         _loc5_.b.writeFloat(_loc4_);
         _loc3_ = param2.buffer;
         _loc3_.b.position = param2.byteOffset + 12;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 12;
         _loc5_.b.writeFloat(_loc4_);
         _loc3_ = param2.buffer;
         _loc3_.b.position = param2.byteOffset + 16;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 16;
         _loc5_.b.writeFloat(_loc4_);
         _loc3_ = param2.buffer;
         _loc3_.b.position = param2.byteOffset + 24;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 24;
         _loc5_.b.writeFloat(_loc4_);
         _loc3_ = param2.buffer;
         _loc3_.b.position = param2.byteOffset + 28;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 28;
         _loc5_.b.writeFloat(_loc4_);
      }
      
      public static function copyRowFrom(param1:ArrayBufferView, param2:int, param3:Vector4) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:* = null as Bytes;
         if(param2 > 2)
         {
            throw Exception.thrown("Row " + param2 + " out of bounds (2)");
         }
         if(param2 == 0)
         {
            _loc4_ = param3.x;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.y;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 12;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.z;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 24;
            _loc5_.b.writeFloat(_loc4_);
         }
         else if(param2 == 1)
         {
            _loc4_ = param3.x;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 4;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.y;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 16;
            _loc5_.b.writeFloat(_loc4_);
            _loc4_ = param3.z;
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 28;
            _loc5_.b.writeFloat(_loc4_);
         }
      }
      
      public static function copyRowTo(param1:ArrayBufferView, param2:int, param3:Vector4) : void
      {
         var _loc4_:* = null as Bytes;
         var _loc5_:* = null as Bytes;
         var _loc6_:* = null as Bytes;
         if(param2 > 2)
         {
            throw Exception.thrown("Row " + param2 + " out of bounds (2)");
         }
         if(param2 == 0)
         {
            _loc4_ = param1.buffer;
            _loc4_.b.position = param1.byteOffset;
            param3.x = _loc4_.b.readFloat();
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 12;
            param3.y = _loc5_.b.readFloat();
            _loc6_ = param1.buffer;
            _loc6_.b.position = param1.byteOffset + 24;
            param3.z = _loc6_.b.readFloat();
         }
         else if(param2 == 1)
         {
            _loc4_ = param1.buffer;
            _loc4_.b.position = param1.byteOffset + 4;
            param3.x = _loc4_.b.readFloat();
            _loc5_ = param1.buffer;
            _loc5_.b.position = param1.byteOffset + 16;
            param3.y = _loc5_.b.readFloat();
            _loc6_ = param1.buffer;
            _loc6_.b.position = param1.byteOffset + 28;
            param3.z = _loc6_.b.readFloat();
         }
         else
         {
            param3.x = 0;
            param3.y = 0;
            param3.z = 1;
         }
      }
      
      public static function createBox(param1:ArrayBufferView, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0, param6:Number = 0) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = null as Bytes;
         if(param4 != 0)
         {
            _loc7_ = Math.cos(param4);
            _loc8_ = Math.sin(param4);
            _loc9_ = _loc7_ * param2;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset;
            _loc10_.b.writeFloat(_loc9_);
            _loc9_ = _loc8_ * param3;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 4;
            _loc10_.b.writeFloat(_loc9_);
            _loc9_ = -_loc8_ * param2;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 12;
            _loc10_.b.writeFloat(_loc9_);
            _loc9_ = _loc7_ * param3;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 16;
            _loc10_.b.writeFloat(_loc9_);
         }
         else
         {
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset;
            _loc10_.b.writeFloat(param2);
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 4;
            _loc10_.b.writeFloat(0);
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 12;
            _loc10_.b.writeFloat(0);
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 16;
            _loc10_.b.writeFloat(param3);
         }
         _loc10_ = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 24;
         _loc10_.b.writeFloat(param5);
         _loc10_ = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 28;
         _loc10_.b.writeFloat(param6);
      }
      
      public static function createGradientBox(param1:ArrayBufferView, param2:Number, param3:Number, param4:Number = 0, param5:Number = 0, param6:Number = 0) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:* = null as Bytes;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Bytes;
         _loc7_ = param2 / 1638.4;
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset;
         _loc8_.b.writeFloat(_loc7_);
         _loc7_ = param3 / 1638.4;
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 16;
         _loc8_.b.writeFloat(_loc7_);
         if(param4 != 0)
         {
            _loc7_ = Math.cos(param4);
            _loc9_ = Math.sin(param4);
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 16;
            _loc10_ = _loc9_ * _loc8_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 4;
            _loc11_.b.writeFloat(_loc10_);
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset;
            _loc10_ = -_loc9_ * _loc8_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 12;
            _loc11_.b.writeFloat(_loc10_);
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset;
            _loc10_ = _loc8_.b.readFloat() * _loc7_;
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset;
            _loc11_.b.writeFloat(_loc10_);
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 16;
            _loc10_ = _loc8_.b.readFloat() * _loc7_;
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 16;
            _loc11_.b.writeFloat(_loc10_);
         }
         else
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 4;
            _loc8_.b.writeFloat(0);
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 12;
            _loc8_.b.writeFloat(0);
         }
         _loc7_ = param5 + param2 / 2;
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 24;
         _loc8_.b.writeFloat(_loc7_);
         _loc7_ = param6 + param3 / 2;
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 28;
         _loc8_.b.writeFloat(_loc7_);
      }
      
      public static function equals(param1:ArrayBufferView, param2:ArrayBufferView) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as Bytes;
         var _loc9_:Number = NaN;
         var _loc10_:* = null as Bytes;
         if(param2 != null)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 24;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset + 24;
            _loc7_ = _loc9_ == _loc10_.b.readFloat();
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 28;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset + 28;
            _loc6_ = _loc9_ == _loc10_.b.readFloat();
         }
         else
         {
            _loc6_ = false;
         }
         if(_loc6_)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset;
            _loc5_ = _loc9_ == _loc10_.b.readFloat();
         }
         else
         {
            _loc5_ = false;
         }
         if(_loc5_)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 4;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset + 4;
            _loc4_ = _loc9_ == _loc10_.b.readFloat();
         }
         else
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 12;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset + 12;
            _loc3_ = _loc9_ == _loc10_.b.readFloat();
         }
         else
         {
            _loc3_ = false;
         }
         if(_loc3_)
         {
            _loc8_ = param1.buffer;
            _loc8_.b.position = param1.byteOffset + 16;
            _loc9_ = _loc8_.b.readFloat();
            _loc10_ = param2.buffer;
            _loc10_.b.position = param2.byteOffset + 16;
            return _loc9_ == _loc10_.b.readFloat();
         }
         return false;
      }
      
      public static function deltaTransformVector(param1:ArrayBufferView, param2:Vector2, param3:Vector2 = undefined) : Vector2
      {
         if(param3 == null)
         {
            param3 = new Vector2();
         }
         var _loc4_:Number = param2.x;
         var _loc5_:Bytes = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         var _loc6_:Number = _loc4_ * _loc5_.b.readFloat();
         var _loc7_:Number = param2.y;
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 12;
         param3.x = _loc6_ + _loc7_ * _loc8_.b.readFloat();
         var _loc9_:Number = param2.x;
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 4;
         var _loc11_:Number = _loc9_ * _loc10_.b.readFloat();
         var _loc12_:Number = param2.y;
         var _loc13_:Bytes = param1.buffer;
         _loc13_.b.position = param1.byteOffset + 16;
         param3.y = _loc11_ + _loc12_ * _loc13_.b.readFloat();
         return param3;
      }
      
      public static function fromCairoMatrix3(param1:CairoMatrix3) : ArrayBufferView
      {
         return Matrix3_Impl_._new(param1.a,param1.b,param1.c,param1.d,param1.tx,param1.ty);
      }
      
      public static function fromFloat32Array(param1:ArrayBufferView) : ArrayBufferView
      {
         if(param1.length != 9)
         {
            throw Exception.thrown("Expected array of length 9, got " + param1.length);
         }
         return param1;
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
         _loc2_.b.position = param1.byteOffset + 12;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 16;
         _loc2_.b.writeFloat(1);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 24;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 28;
         _loc2_.b.writeFloat(0);
      }
      
      public static function invert(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc10_:* = null as Bytes;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null as Bytes;
         var _loc15_:* = null as Bytes;
         var _loc16_:* = null as Bytes;
         var _loc17_:Number = NaN;
         var _loc18_:* = null as Bytes;
         var _loc19_:Number = NaN;
         var _loc20_:* = null as Bytes;
         var _loc21_:Number = NaN;
         var _loc22_:* = null as Bytes;
         var _loc23_:Number = NaN;
         var _loc24_:* = null as Bytes;
         var _loc25_:Number = NaN;
         var _loc26_:* = null as Bytes;
         var _loc27_:Number = NaN;
         var _loc28_:* = null as Bytes;
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         var _loc3_:Number = _loc2_.b.readFloat();
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 16;
         var _loc5_:Number = _loc3_ * _loc4_.b.readFloat();
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 4;
         var _loc7_:Number = _loc6_.b.readFloat();
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 12;
         var _loc9_:Number = _loc5_ - _loc7_ * _loc8_.b.readFloat();
         if(_loc9_ == 0)
         {
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 16;
            _loc10_.b.writeFloat(0);
            _loc11_ = 0;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 12;
            _loc10_.b.writeFloat(_loc11_);
            _loc12_ = _loc11_;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 4;
            _loc10_.b.writeFloat(_loc12_);
            _loc13_ = _loc12_;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset;
            _loc10_.b.writeFloat(_loc13_);
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 24;
            _loc11_ = -_loc10_.b.readFloat();
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset + 24;
            _loc14_.b.writeFloat(_loc11_);
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 28;
            _loc11_ = -_loc10_.b.readFloat();
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset + 28;
            _loc14_.b.writeFloat(_loc11_);
         }
         else
         {
            _loc9_ = 1 / _loc9_;
            _loc10_ = param1.buffer;
            _loc10_.b.position = param1.byteOffset + 16;
            _loc11_ = _loc10_.b.readFloat() * _loc9_;
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset;
            _loc12_ = _loc14_.b.readFloat() * _loc9_;
            _loc15_ = param1.buffer;
            _loc15_.b.position = param1.byteOffset + 16;
            _loc15_.b.writeFloat(_loc12_);
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset;
            _loc14_.b.writeFloat(_loc11_);
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset + 4;
            _loc12_ = _loc14_.b.readFloat() * -_loc9_;
            _loc15_ = param1.buffer;
            _loc15_.b.position = param1.byteOffset + 4;
            _loc15_.b.writeFloat(_loc12_);
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset + 12;
            _loc12_ = _loc14_.b.readFloat() * -_loc9_;
            _loc15_ = param1.buffer;
            _loc15_.b.position = param1.byteOffset + 12;
            _loc15_.b.writeFloat(_loc12_);
            _loc14_ = param1.buffer;
            _loc14_.b.position = param1.byteOffset;
            _loc12_ = -_loc14_.b.readFloat();
            _loc15_ = param1.buffer;
            _loc15_.b.position = param1.byteOffset + 24;
            _loc13_ = _loc12_ * _loc15_.b.readFloat();
            _loc16_ = param1.buffer;
            _loc16_.b.position = param1.byteOffset + 12;
            _loc17_ = _loc16_.b.readFloat();
            _loc18_ = param1.buffer;
            _loc18_.b.position = param1.byteOffset + 28;
            _loc19_ = _loc13_ - _loc17_ * _loc18_.b.readFloat();
            _loc20_ = param1.buffer;
            _loc20_.b.position = param1.byteOffset + 4;
            _loc21_ = -_loc20_.b.readFloat();
            _loc22_ = param1.buffer;
            _loc22_.b.position = param1.byteOffset + 24;
            _loc23_ = _loc21_ * _loc22_.b.readFloat();
            _loc24_ = param1.buffer;
            _loc24_.b.position = param1.byteOffset + 16;
            _loc25_ = _loc24_.b.readFloat();
            _loc26_ = param1.buffer;
            _loc26_.b.position = param1.byteOffset + 28;
            _loc27_ = _loc23_ - _loc25_ * _loc26_.b.readFloat();
            _loc28_ = param1.buffer;
            _loc28_.b.position = param1.byteOffset + 28;
            _loc28_.b.writeFloat(_loc27_);
            _loc20_ = param1.buffer;
            _loc20_.b.position = param1.byteOffset + 24;
            _loc20_.b.writeFloat(_loc19_);
         }
         if(param1.length != 9)
         {
            throw Exception.thrown("Expected array of length 9, got " + param1.length);
         }
         return param1;
      }
      
      public static function rotate(param1:ArrayBufferView, param2:Number) : void
      {
         var _loc3_:Number = Math.cos(param2);
         var _loc4_:Number = Math.sin(param2);
         var _loc5_:Bytes = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         var _loc6_:Number = _loc5_.b.readFloat() * _loc3_;
         var _loc7_:Bytes = param1.buffer;
         _loc7_.b.position = param1.byteOffset + 4;
         var _loc8_:Number = _loc6_ - _loc7_.b.readFloat() * _loc4_;
         var _loc9_:Bytes = param1.buffer;
         _loc9_.b.position = param1.byteOffset;
         var _loc10_:Number = _loc9_.b.readFloat() * _loc4_;
         var _loc11_:Bytes = param1.buffer;
         _loc11_.b.position = param1.byteOffset + 4;
         var _loc12_:Number = _loc10_ + _loc11_.b.readFloat() * _loc3_;
         var _loc13_:Bytes = param1.buffer;
         _loc13_.b.position = param1.byteOffset + 4;
         _loc13_.b.writeFloat(_loc12_);
         _loc9_ = param1.buffer;
         _loc9_.b.position = param1.byteOffset;
         _loc9_.b.writeFloat(_loc8_);
         _loc9_ = param1.buffer;
         _loc9_.b.position = param1.byteOffset + 12;
         _loc10_ = _loc9_.b.readFloat() * _loc3_;
         _loc11_ = param1.buffer;
         _loc11_.b.position = param1.byteOffset + 16;
         _loc12_ = _loc10_ - _loc11_.b.readFloat() * _loc4_;
         _loc13_ = param1.buffer;
         _loc13_.b.position = param1.byteOffset + 12;
         var _loc14_:Number = _loc13_.b.readFloat() * _loc4_;
         var _loc15_:Bytes = param1.buffer;
         _loc15_.b.position = param1.byteOffset + 16;
         var _loc16_:Number = _loc14_ + _loc15_.b.readFloat() * _loc3_;
         var _loc17_:Bytes = param1.buffer;
         _loc17_.b.position = param1.byteOffset + 16;
         _loc17_.b.writeFloat(_loc16_);
         _loc13_ = param1.buffer;
         _loc13_.b.position = param1.byteOffset + 12;
         _loc13_.b.writeFloat(_loc12_);
         _loc13_ = param1.buffer;
         _loc13_.b.position = param1.byteOffset + 24;
         _loc14_ = _loc13_.b.readFloat() * _loc3_;
         _loc15_ = param1.buffer;
         _loc15_.b.position = param1.byteOffset + 28;
         _loc16_ = _loc14_ - _loc15_.b.readFloat() * _loc4_;
         _loc17_ = param1.buffer;
         _loc17_.b.position = param1.byteOffset + 24;
         var _loc18_:Number = _loc17_.b.readFloat() * _loc4_;
         var _loc19_:Bytes = param1.buffer;
         _loc19_.b.position = param1.byteOffset + 28;
         var _loc20_:Number = _loc18_ + _loc19_.b.readFloat() * _loc3_;
         var _loc21_:Bytes = param1.buffer;
         _loc21_.b.position = param1.byteOffset + 28;
         _loc21_.b.writeFloat(_loc20_);
         _loc17_ = param1.buffer;
         _loc17_.b.position = param1.byteOffset + 24;
         _loc17_.b.writeFloat(_loc16_);
      }
      
      public static function scale(param1:ArrayBufferView, param2:Number, param3:Number) : void
      {
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset;
         var _loc5_:Number = _loc4_.b.readFloat() * param2;
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 4;
         _loc5_ = _loc4_.b.readFloat() * param3;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 4;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 12;
         _loc5_ = _loc4_.b.readFloat() * param2;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 12;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 16;
         _loc5_ = _loc4_.b.readFloat() * param3;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 16;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 24;
         _loc5_ = _loc4_.b.readFloat() * param2;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 24;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 28;
         _loc5_ = _loc4_.b.readFloat() * param3;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 28;
         _loc6_.b.writeFloat(_loc5_);
      }
      
      public static function setRotation(param1:ArrayBufferView, param2:Number, param3:Number = 1) : void
      {
         var _loc4_:Number = Math.cos(param2) * param3;
         var _loc5_:Bytes = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         _loc5_.b.writeFloat(_loc4_);
         _loc4_ = Math.sin(param2) * param3;
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 12;
         _loc5_.b.writeFloat(_loc4_);
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset + 12;
         _loc4_ = -_loc5_.b.readFloat();
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 4;
         _loc6_.b.writeFloat(_loc4_);
         _loc5_ = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         _loc4_ = _loc5_.b.readFloat();
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 16;
         _loc6_.b.writeFloat(_loc4_);
      }
      
      public static function setTo(param1:ArrayBufferView, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : void
      {
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset;
         _loc8_.b.writeFloat(param2);
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 4;
         _loc8_.b.writeFloat(param3);
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 12;
         _loc8_.b.writeFloat(param4);
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 16;
         _loc8_.b.writeFloat(param5);
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 24;
         _loc8_.b.writeFloat(param6);
         _loc8_ = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 28;
         _loc8_.b.writeFloat(param7);
      }
      
      public static function toCairoMatrix3(param1:ArrayBufferView) : CairoMatrix3
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         var _loc3_:Number = _loc2_.b.readFloat();
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 4;
         var _loc5_:Number = _loc4_.b.readFloat();
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 12;
         var _loc7_:Number = _loc6_.b.readFloat();
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 16;
         var _loc9_:Number = _loc8_.b.readFloat();
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 24;
         var _loc11_:Number = _loc10_.b.readFloat();
         var _loc12_:Bytes = param1.buffer;
         _loc12_.b.position = param1.byteOffset + 28;
         return new CairoMatrix3(_loc3_,_loc5_,_loc7_,_loc9_,_loc11_,_loc12_.b.readFloat());
      }
      
      public static function toString(param1:ArrayBufferView) : String
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         var _loc3_:String = "matrix(" + _loc2_.b.readFloat() + ", ";
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 4;
         var _loc5_:String = _loc3_ + _loc4_.b.readFloat() + ", ";
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 12;
         var _loc7_:String = _loc5_ + _loc6_.b.readFloat() + ", ";
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 16;
         var _loc9_:String = _loc7_ + _loc8_.b.readFloat() + ", ";
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 24;
         var _loc11_:String = _loc9_ + _loc10_.b.readFloat() + ", ";
         var _loc12_:Bytes = param1.buffer;
         _loc12_.b.position = param1.byteOffset + 28;
         return _loc11_ + _loc12_.b.readFloat() + ")";
      }
      
      public static function transformRect(param1:ArrayBufferView, param2:Rectangle, param3:Rectangle = undefined) : Rectangle
      {
         if(param3 == null)
         {
            param3 = new Rectangle();
         }
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset;
         var _loc5_:Number = _loc4_.b.readFloat() * param2.x;
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 12;
         var _loc7_:Number = _loc5_ + _loc6_.b.readFloat() * param2.y;
         var _loc8_:Number = _loc7_;
         var _loc9_:Bytes = param1.buffer;
         _loc9_.b.position = param1.byteOffset + 4;
         var _loc10_:Number = _loc9_.b.readFloat() * param2.x;
         var _loc11_:Bytes = param1.buffer;
         _loc11_.b.position = param1.byteOffset + 16;
         var _loc12_:Number = _loc10_ + _loc11_.b.readFloat() * param2.y;
         var _loc13_:Number = _loc12_;
         var _loc14_:Bytes = param1.buffer;
         _loc14_.b.position = param1.byteOffset;
         var _loc15_:Number = _loc14_.b.readFloat() * (param2.x + param2.width);
         var _loc16_:Bytes = param1.buffer;
         _loc16_.b.position = param1.byteOffset + 12;
         var _loc17_:Number = _loc15_ + _loc16_.b.readFloat() * param2.y;
         var _loc18_:Bytes = param1.buffer;
         _loc18_.b.position = param1.byteOffset + 4;
         var _loc19_:Number = _loc18_.b.readFloat() * (param2.x + param2.width);
         var _loc20_:Bytes = param1.buffer;
         _loc20_.b.position = param1.byteOffset + 16;
         var _loc21_:Number = _loc19_ + _loc20_.b.readFloat() * param2.y;
         if(_loc17_ < _loc7_)
         {
            _loc7_ = _loc17_;
         }
         if(_loc21_ < _loc12_)
         {
            _loc12_ = _loc21_;
         }
         if(_loc17_ > _loc8_)
         {
            _loc8_ = _loc17_;
         }
         if(_loc21_ > _loc13_)
         {
            _loc13_ = _loc21_;
         }
         var _loc22_:Bytes = param1.buffer;
         _loc22_.b.position = param1.byteOffset;
         var _loc23_:Number = _loc22_.b.readFloat() * (param2.x + param2.width);
         var _loc24_:Bytes = param1.buffer;
         _loc24_.b.position = param1.byteOffset + 12;
         _loc17_ = _loc23_ + _loc24_.b.readFloat() * (param2.y + param2.height);
         var _loc25_:Bytes = param1.buffer;
         _loc25_.b.position = param1.byteOffset + 4;
         var _loc26_:Number = _loc25_.b.readFloat() * (param2.x + param2.width);
         var _loc27_:Bytes = param1.buffer;
         _loc27_.b.position = param1.byteOffset + 16;
         _loc21_ = _loc26_ + _loc27_.b.readFloat() * (param2.y + param2.height);
         if(_loc17_ < _loc7_)
         {
            _loc7_ = _loc17_;
         }
         if(_loc21_ < _loc12_)
         {
            _loc12_ = _loc21_;
         }
         if(_loc17_ > _loc8_)
         {
            _loc8_ = _loc17_;
         }
         if(_loc21_ > _loc13_)
         {
            _loc13_ = _loc21_;
         }
         var _loc28_:Bytes = param1.buffer;
         _loc28_.b.position = param1.byteOffset;
         var _loc29_:Number = _loc28_.b.readFloat() * param2.x;
         var _loc30_:Bytes = param1.buffer;
         _loc30_.b.position = param1.byteOffset + 12;
         _loc17_ = _loc29_ + _loc30_.b.readFloat() * (param2.y + param2.height);
         var _loc31_:Bytes = param1.buffer;
         _loc31_.b.position = param1.byteOffset + 4;
         var _loc32_:Number = _loc31_.b.readFloat() * param2.x;
         var _loc33_:Bytes = param1.buffer;
         _loc33_.b.position = param1.byteOffset + 16;
         _loc21_ = _loc32_ + _loc33_.b.readFloat() * (param2.y + param2.height);
         if(_loc17_ < _loc7_)
         {
            _loc7_ = _loc17_;
         }
         if(_loc21_ < _loc12_)
         {
            _loc12_ = _loc21_;
         }
         if(_loc17_ > _loc8_)
         {
            _loc8_ = _loc17_;
         }
         if(_loc21_ > _loc13_)
         {
            _loc13_ = _loc21_;
         }
         param3.setTo(_loc7_ + _loc17_,_loc12_ + _loc21_,_loc8_ - _loc7_,_loc13_ - _loc12_);
         return param3;
      }
      
      public static function transformVector(param1:ArrayBufferView, param2:Vector2, param3:Vector2 = undefined) : Vector2
      {
         if(param3 == null)
         {
            param3 = new Vector2();
         }
         var _loc4_:Number = param2.x;
         var _loc5_:Bytes = param1.buffer;
         _loc5_.b.position = param1.byteOffset;
         var _loc6_:Number = _loc4_ * _loc5_.b.readFloat();
         var _loc7_:Number = param2.y;
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 12;
         var _loc9_:Number = _loc6_ + _loc7_ * _loc8_.b.readFloat();
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 24;
         param3.x = _loc9_ + _loc10_.b.readFloat();
         var _loc11_:Number = param2.x;
         var _loc12_:Bytes = param1.buffer;
         _loc12_.b.position = param1.byteOffset + 4;
         var _loc13_:Number = _loc11_ * _loc12_.b.readFloat();
         var _loc14_:Number = param2.y;
         var _loc15_:Bytes = param1.buffer;
         _loc15_.b.position = param1.byteOffset + 16;
         var _loc16_:Number = _loc13_ + _loc14_ * _loc15_.b.readFloat();
         var _loc17_:Bytes = param1.buffer;
         _loc17_.b.position = param1.byteOffset + 28;
         param3.y = _loc16_ + _loc17_.b.readFloat();
         return param3;
      }
      
      public static function translate(param1:ArrayBufferView, param2:Number, param3:Number) : void
      {
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 24;
         var _loc5_:Number = _loc4_.b.readFloat() + param2;
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 24;
         _loc6_.b.writeFloat(_loc5_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 28;
         _loc5_ = _loc4_.b.readFloat() + param3;
         _loc6_ = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 28;
         _loc6_.b.writeFloat(_loc5_);
      }
      
      public static function get_a(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         return _loc2_.b.readFloat();
      }
      
      public static function set_a(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_b(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 4;
         return _loc2_.b.readFloat();
      }
      
      public static function set_b(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 4;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_c(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 12;
         return _loc2_.b.readFloat();
      }
      
      public static function set_c(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 12;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_d(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 16;
         return _loc2_.b.readFloat();
      }
      
      public static function set_d(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 16;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_tx(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 24;
         return _loc2_.b.readFloat();
      }
      
      public static function set_tx(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 24;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_ty(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 28;
         return _loc2_.b.readFloat();
      }
      
      public static function set_ty(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 28;
         _loc3_.b.writeFloat(param2);
         return param2;
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

