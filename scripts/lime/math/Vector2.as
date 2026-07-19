package lime.math
{
   import flash.Boot;
   import flash.geom.Point;
   
   public class Vector2
   {
      
      public var y:Number;
      
      public var x:Number;
      
      public function Vector2(param1:Number = 0, param2:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         x = param1;
         y = param2;
      }
      
      public static function distance(param1:Vector2, param2:Vector2) : Number
      {
         var _loc3_:Number = param1.x - param2.x;
         var _loc4_:Number = param1.y - param2.y;
         return Math.sqrt(_loc3_ * _loc3_ + _loc4_ * _loc4_);
      }
      
      public static function interpolate(param1:Vector2, param2:Vector2, param3:Number, param4:Vector2 = undefined) : Vector2
      {
         if(param4 == null)
         {
            param4 = new Vector2();
         }
         param4.x = param2.x + param3 * (param1.x - param2.x);
         param4.y = param2.y + param3 * (param1.y - param2.y);
         return param4;
      }
      
      public static function polar(param1:Number, param2:Number, param3:Vector2 = undefined) : Vector2
      {
         if(param3 == null)
         {
            param3 = new Vector2();
         }
         var _loc4_:Number = param1 * Math.sin(param2);
         param3.x = param1 * Math.cos(param2);
         param3.y = _loc4_;
         return param3;
      }
      
      public function subtract(param1:Vector2, param2:Vector2 = undefined) : Vector2
      {
         if(param2 == null)
         {
            param2 = new Vector2();
         }
         param2.x = x - param1.x;
         param2.y = y - param1.y;
         return param2;
      }
      
      public function setTo(param1:Number, param2:Number) : void
      {
         x = param1;
         y = param2;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         x += param1;
         y += param2;
      }
      
      public function normalize(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(x == 0 && y == 0)
         {
            return;
         }
         _loc2_ = param1 / Math.sqrt(x * x + y * y);
         x *= _loc2_;
         y *= _loc2_;
      }
      
      public function get_lengthSquared() : Number
      {
         return x * x + y * y;
      }
      
      public function get_length() : Number
      {
         return Math.sqrt(x * x + y * y);
      }
      
      public function equals(param1:Vector2) : Boolean
      {
         if(param1 != null && param1.x == x)
         {
            return param1.y == y;
         }
         return false;
      }
      
      public function clone() : Vector2
      {
         return new Vector2(x,y);
      }
      
      public function add(param1:Vector2, param2:Vector2 = undefined) : Vector2
      {
         if(param2 == null)
         {
            param2 = new Vector2();
         }
         param2.x = param1.x + x;
         param2.y = param1.y + y;
         return param2;
      }
      
      public function __toFlashPoint() : Point
      {
         return new Point(x,y);
      }
   }
}

