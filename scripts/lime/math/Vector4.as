package lime.math
{
   import flash.Boot;
   
   public class Vector4
   {
      
      public var z:Number;
      
      public var y:Number;
      
      public var x:Number;
      
      public var w:Number;
      
      public function Vector4(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         w = param4;
         x = param1;
         y = param2;
         z = param3;
      }
      
      public static function angleBetween(param1:Vector4, param2:Vector4) : Number
      {
         var _loc3_:Vector4 = new Vector4(param1.x,param1.y,param1.z,param1.w);
         var _loc4_:Number = Math.sqrt(_loc3_.x * _loc3_.x + _loc3_.y * _loc3_.y + _loc3_.z * _loc3_.z);
         if(_loc4_ != 0)
         {
            _loc3_.x /= _loc4_;
            _loc3_.y /= _loc4_;
            _loc3_.z /= _loc4_;
         }
         var _loc5_:Vector4 = new Vector4(param2.x,param2.y,param2.z,param2.w);
         _loc4_ = Math.sqrt(_loc5_.x * _loc5_.x + _loc5_.y * _loc5_.y + _loc5_.z * _loc5_.z);
         if(_loc4_ != 0)
         {
            _loc5_.x /= _loc4_;
            _loc5_.y /= _loc4_;
            _loc5_.z /= _loc4_;
         }
         return Math.acos(_loc3_.x * _loc5_.x + _loc3_.y * _loc5_.y + _loc3_.z * _loc5_.z);
      }
      
      public static function distance(param1:Vector4, param2:Vector4) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         var _loc5_:Number = param2.z - param1.z;
         return Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_);
      }
      
      public static function distanceSquared(param1:Vector4, param2:Vector4) : Number
      {
         var _loc3_:Number = param2.x - param1.x;
         var _loc4_:Number = param2.y - param1.y;
         var _loc5_:Number = param2.z - param1.z;
         return _loc3_ * _loc3_ + _loc4_ * _loc4_ + _loc5_ * _loc5_;
      }
      
      public static function get_X_AXIS() : Vector4
      {
         return new Vector4(1,0,0);
      }
      
      public static function get_Y_AXIS() : Vector4
      {
         return new Vector4(0,1,0);
      }
      
      public static function get_Z_AXIS() : Vector4
      {
         return new Vector4(0,0,1);
      }
      
      public function toString() : String
      {
         return "Vector4(" + x + ", " + y + ", " + z + ")";
      }
      
      public function subtract(param1:Vector4, param2:Vector4 = undefined) : Vector4
      {
         if(param2 == null)
         {
            param2 = new Vector4();
         }
         param2.x = x - param1.x;
         param2.y = y - param1.y;
         param2.z = z - param1.z;
         return param2;
      }
      
      public function setTo(param1:Number, param2:Number, param3:Number) : void
      {
         x = param1;
         y = param2;
         z = param3;
      }
      
      public function scaleBy(param1:Number) : void
      {
         x *= param1;
         y *= param1;
         z *= param1;
      }
      
      public function project() : void
      {
         x /= w;
         y /= w;
         z /= w;
      }
      
      public function normalize() : Number
      {
         var _loc1_:Number = Math.sqrt(x * x + y * y + z * z);
         if(_loc1_ != 0)
         {
            x /= _loc1_;
            y /= _loc1_;
            z /= _loc1_;
         }
         return _loc1_;
      }
      
      public function negate() : void
      {
         x *= -1;
         y *= -1;
         z *= -1;
      }
      
      public function nearEquals(param1:Vector4, param2:Number, param3:Object = undefined) : Boolean
      {
         if(param3 == null)
         {
            param3 = false;
         }
         if(Math.abs(x - param1.x) < param2 && Math.abs(y - param1.y) < param2 && Math.abs(z - param1.z) < param2)
         {
            if(param3)
            {
               return Math.abs(w - param1.w) < param2;
            }
            return true;
         }
         return false;
      }
      
      public function incrementBy(param1:Vector4) : void
      {
         x += param1.x;
         y += param1.y;
         z += param1.z;
      }
      
      public function get_lengthSquared() : Number
      {
         return x * x + y * y + z * z;
      }
      
      public function get_length() : Number
      {
         return Math.sqrt(x * x + y * y + z * z);
      }
      
      public function equals(param1:Vector4, param2:Object = undefined) : Boolean
      {
         if(param2 == null)
         {
            param2 = false;
         }
         if(x == param1.x && y == param1.y && z == param1.z)
         {
            if(param2)
            {
               return w == param1.w;
            }
            return true;
         }
         return false;
      }
      
      public function dotProduct(param1:Vector4) : Number
      {
         return x * param1.x + y * param1.y + z * param1.z;
      }
      
      public function decrementBy(param1:Vector4) : void
      {
         x -= param1.x;
         y -= param1.y;
         z -= param1.z;
      }
      
      public function crossProduct(param1:Vector4, param2:Vector4 = undefined) : Vector4
      {
         if(param2 == null)
         {
            param2 = new Vector4();
         }
         var _loc3_:Number = z * param1.x - x * param1.z;
         var _loc4_:Number = x * param1.y - y * param1.x;
         param2.x = y * param1.z - z * param1.y;
         param2.y = _loc3_;
         param2.z = _loc4_;
         param2.w = 1;
         return param2;
      }
      
      public function copyFrom(param1:Vector4) : void
      {
         x = param1.x;
         y = param1.y;
         z = param1.z;
      }
      
      public function clone() : Vector4
      {
         return new Vector4(x,y,z,w);
      }
      
      public function add(param1:Vector4, param2:Vector4 = undefined) : Vector4
      {
         if(param2 == null)
         {
            param2 = new Vector4();
         }
         param2.x = x + param1.x;
         param2.y = y + param1.y;
         param2.z = z + param1.z;
         return param2;
      }
   }
}

