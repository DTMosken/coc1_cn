package motion._MotionPath
{
   import flash.Boot;
   
   public class BezierSplinePath extends ComponentPath
   {
      
      public var through:Array;
      
      public function BezierSplinePath(param1:Array = undefined, param2:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         through = param1;
         strength = param2;
      }
      
      override public function set_start(param1:Number) : Number
      {
         var _loc2_:* = null as Array;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(int(paths.length) == 0 || Math.abs(param1 - get_start()) > 1e-7)
         {
            _loc2_ = computeControlPoints(param1);
            _loc3_ = strength / int(_loc2_.length);
            strength = 0;
            paths.splice(0,int(paths.length));
            _loc4_ = 0;
            _loc5_ = int(_loc2_.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _loc4_++;
               addPath(new BezierPath(Number(through[_loc6_]),_loc2_[_loc6_],_loc3_));
            }
         }
         return Number(super.set_start(param1));
      }
      
      override public function get_end() : Number
      {
         return Number(through[int(through.length) - 1]);
      }
      
      public function computeControlPoints(param1:Number) : Array
      {
         var _loc7_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc2_:Array = [param1].concat(through);
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:int = _loc3_;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc4_.push([0,0]);
         }
         var _loc8_:Array = _loc4_;
         var _loc9_:Array = [];
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         var _loc12_:Array = [];
         _loc9_[0] = 0;
         _loc10_[0] = 2;
         _loc11_[0] = 1;
         _loc12_[0] = Number(_loc2_[0]) + 2 * Number(_loc2_[1]);
         _loc5_ = 1;
         _loc6_ = _loc3_ - 1;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc9_[_loc7_] = 1;
            _loc10_[_loc7_] = 4;
            _loc11_[_loc7_] = 1;
            _loc12_[_loc7_] = 4 * Number(_loc2_[_loc7_]) + 2 * Number(_loc2_[_loc7_ + 1]);
         }
         _loc9_[_loc3_ - 1] = 1;
         _loc10_[_loc3_ - 1] = 2;
         _loc11_[_loc3_ - 1] = 0;
         _loc12_[_loc3_ - 1] = 3 * Number(_loc2_[_loc3_ - 1]);
         _loc5_ = 1;
         _loc6_ = _loc3_;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc13_ = Number(_loc9_[_loc7_]) / Number(_loc10_[_loc7_ - 1]);
            _loc10_[_loc7_] -= _loc13_ * Number(_loc11_[_loc7_ - 1]);
            _loc12_[_loc7_] -= _loc13_ * Number(_loc12_[_loc7_ - 1]);
         }
         _loc8_[_loc3_ - 1][0] = Number(_loc12_[_loc3_ - 1]) / Number(_loc10_[_loc3_ - 1]);
         _loc5_ = _loc3_ - 2;
         while(_loc5_ >= 0)
         {
            _loc8_[_loc5_][0] = (Number(_loc12_[_loc5_]) - Number(_loc11_[_loc5_]) * Number(_loc8_[_loc5_ + 1][0])) / Number(_loc10_[_loc5_]);
            _loc5_--;
         }
         _loc6_ = 0;
         _loc7_ = _loc3_ - 1;
         while(_loc6_ < _loc7_)
         {
            _loc14_ = _loc6_++;
            _loc8_[_loc14_][1] = 2 * Number(_loc2_[_loc14_ + 1]) - Number(_loc8_[_loc14_ + 1][0]);
         }
         _loc8_[_loc3_ - 1][1] = 0.5 * (Number(_loc2_[_loc3_]) + Number(_loc8_[_loc3_ - 1][0]));
         _loc8_.pop();
         return _loc8_;
      }
   }
}

