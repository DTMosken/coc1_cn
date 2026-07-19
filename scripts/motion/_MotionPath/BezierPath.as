package motion._MotionPath
{
   import flash.Boot;
   import motion.IComponentPath;
   
   public class BezierPath implements IComponentPath
   {
      
      public var strength:Number;
      
      public var end:Number;
      
      public var control:Array;
      
      public var _start:Number;
      
      public var _end:Number;
      
      public function BezierPath(param1:Number = 0, param2:Array = undefined, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _end = param1;
         control = param2;
         strength = param3;
      }
      
      public function set_start(param1:Number) : Number
      {
         return _start = param1;
      }
      
      public function get_start() : Number
      {
         return _start;
      }
      
      public function get_end() : Number
      {
         return _end;
      }
      
      public function calculate(param1:Number) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Number = 1 - param1;
         switch(int(control.length))
         {
            case 0:
               return _loc2_ * _start + param1 * _end;
            case 1:
               return _loc2_ * _loc2_ * _start + 2 * _loc2_ * param1 * Number(control[0]) + param1 * param1 * _end;
            case 2:
               return _loc2_ * _loc2_ * _loc2_ * _start + 3 * _loc2_ * _loc2_ * param1 * Number(control[0]) + 3 * _loc2_ * param1 * param1 * Number(control[1]) + param1 * param1 * param1 * _end;
            default:
               if(_loc2_ < 1e-7)
               {
                  return _end;
               }
               _loc3_ = param1 / _loc2_;
               _loc4_ = int(control.length) + 1;
               _loc5_ = Math.pow(_loc2_,_loc4_);
               _loc6_ = _loc5_ * _start;
               _loc7_ = 1;
               _loc8_ = _loc4_;
               while(_loc7_ < _loc8_)
               {
                  _loc9_ = _loc7_++;
                  _loc5_ *= _loc3_ * (_loc4_ + 1 - _loc9_) / _loc9_;
                  _loc6_ += _loc5_ * Number(control[_loc9_ - 1]);
               }
               _loc5_ *= _loc3_ / _loc4_;
               return _loc6_ + _loc5_ * _end;
         }
      }
   }
}

