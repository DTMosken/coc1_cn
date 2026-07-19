package lime.math
{
   import flash.Boot;
   import flash.geom.Rectangle;
   
   public class Rectangle
   {
      
      public var y:Number;
      
      public var x:Number;
      
      public var width:Number;
      
      public var height:Number;
      
      public function Rectangle(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         x = param1;
         y = param2;
         width = param3;
         height = param4;
      }
      
      public function union(param1:lime.math.Rectangle, param2:lime.math.Rectangle = undefined) : lime.math.Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         if(param2 == null)
         {
            param2 = new lime.math.Rectangle();
         }
         if(width == 0 || height == 0)
         {
            param2.copyFrom(param1);
         }
         else if(param1.width == 0 || param1.height == 0)
         {
            param2.copyFrom(this);
         }
         else
         {
            _loc3_ = x > param1.x ? param1.x : x;
            _loc4_ = get_right() < param1.get_right() ? param1.get_right() : get_right();
            _loc5_ = y > param1.y ? param1.y : y;
            _loc6_ = get_bottom() < param1.get_bottom() ? param1.get_bottom() : get_bottom();
            param2.setTo(_loc3_,_loc5_,_loc4_ - _loc3_,_loc6_ - _loc5_);
         }
         return param2;
      }
      
      public function set_topLeft(param1:Vector2) : Vector2
      {
         x = param1.x;
         y = param1.y;
         return param1.clone();
      }
      
      public function set_top(param1:Number) : Number
      {
         height -= param1 - y;
         y = param1;
         return param1;
      }
      
      public function set_size(param1:Vector2) : Vector2
      {
         width = param1.x;
         height = param1.y;
         return param1.clone();
      }
      
      public function set_right(param1:Number) : Number
      {
         width = param1 - x;
         return param1;
      }
      
      public function set_left(param1:Number) : Number
      {
         width -= param1 - x;
         x = param1;
         return param1;
      }
      
      public function set_bottomRight(param1:Vector2) : Vector2
      {
         width = param1.x - x;
         height = param1.y - y;
         return param1.clone();
      }
      
      public function set_bottom(param1:Number) : Number
      {
         height = param1 - y;
         return param1;
      }
      
      public function setTo(param1:Number, param2:Number, param3:Number, param4:Number) : void
      {
         x = param1;
         y = param2;
         width = param3;
         height = param4;
      }
      
      public function setEmpty() : void
      {
         x = y = Number(width = Number(height = 0));
      }
      
      public function offsetVector(param1:Vector2) : void
      {
         x += param1.x;
         y += param1.y;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         x += param1;
         y += param2;
      }
      
      public function isEmpty() : Boolean
      {
         if(width > 0)
         {
            return height <= 0;
         }
         return true;
      }
      
      public function intersects(param1:lime.math.Rectangle) : Boolean
      {
         var _loc2_:Number = x < param1.x ? param1.x : x;
         var _loc3_:Number = get_right() > param1.get_right() ? param1.get_right() : get_right();
         if(_loc3_ <= _loc2_)
         {
            return false;
         }
         var _loc4_:Number = y < param1.y ? param1.y : y;
         var _loc5_:Number = get_bottom() > param1.get_bottom() ? param1.get_bottom() : get_bottom();
         return _loc5_ > _loc4_;
      }
      
      public function intersection(param1:lime.math.Rectangle, param2:lime.math.Rectangle = undefined) : lime.math.Rectangle
      {
         if(param2 == null)
         {
            param2 = new lime.math.Rectangle();
         }
         var _loc3_:Number = x < param1.x ? param1.x : x;
         var _loc4_:Number = get_right() > param1.get_right() ? param1.get_right() : get_right();
         if(_loc4_ <= _loc3_)
         {
            param2.setEmpty();
            return param2;
         }
         var _loc5_:Number = y < param1.y ? param1.y : y;
         var _loc6_:Number = get_bottom() > param1.get_bottom() ? param1.get_bottom() : get_bottom();
         if(_loc6_ <= _loc5_)
         {
            param2.setEmpty();
            return param2;
         }
         param2.x = _loc3_;
         param2.y = _loc5_;
         param2.width = _loc4_ - _loc3_;
         param2.height = _loc6_ - _loc5_;
         return param2;
      }
      
      public function inflateVector(param1:Vector2) : void
      {
         inflate(param1.x,param1.y);
      }
      
      public function inflate(param1:Number, param2:Number) : void
      {
         x -= param1;
         width += param1 * 2;
         y -= param2;
         height += param2 * 2;
      }
      
      public function get_topLeft() : Vector2
      {
         return new Vector2(x,y);
      }
      
      public function get_top() : Number
      {
         return y;
      }
      
      public function get_size() : Vector2
      {
         return new Vector2(width,height);
      }
      
      public function get_right() : Number
      {
         return x + width;
      }
      
      public function get_left() : Number
      {
         return x;
      }
      
      public function get_bottomRight() : Vector2
      {
         return new Vector2(x + width,y + height);
      }
      
      public function get_bottom() : Number
      {
         return y + height;
      }
      
      public function equals(param1:lime.math.Rectangle) : Boolean
      {
         if(param1 != null && x == param1.x && y == param1.y && width == param1.width)
         {
            return height == param1.height;
         }
         return false;
      }
      
      public function copyFrom(param1:lime.math.Rectangle) : void
      {
         x = param1.x;
         y = param1.y;
         width = param1.width;
         height = param1.height;
      }
      
      public function containsVector(param1:Vector2) : Boolean
      {
         return contains(param1.x,param1.y);
      }
      
      public function containsRect(param1:lime.math.Rectangle) : Boolean
      {
         if(param1.width <= 0 || param1.height <= 0)
         {
            if(param1.x > x && param1.y > y && param1.get_right() < get_right())
            {
               return param1.get_bottom() < get_bottom();
            }
            return false;
         }
         if(param1.x >= x && param1.y >= y && param1.get_right() <= get_right())
         {
            return param1.get_bottom() <= get_bottom();
         }
         return false;
      }
      
      public function containsPoint(param1:Vector2) : Boolean
      {
         return containsVector(param1);
      }
      
      public function contains(param1:Number, param2:Number) : Boolean
      {
         if(param1 >= x && param2 >= y && param1 < get_right())
         {
            return param2 < get_bottom();
         }
         return false;
      }
      
      public function clone() : lime.math.Rectangle
      {
         return new lime.math.Rectangle(x,y,width,height);
      }
      
      public function __toFlashRectangle() : flash.geom.Rectangle
      {
         return new flash.geom.Rectangle(x,y,width,height);
      }
   }
}

