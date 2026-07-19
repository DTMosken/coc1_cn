package motion
{
   import flash.Boot;
   import motion._MotionPath.BezierPath;
   import motion._MotionPath.BezierSplinePath;
   import motion._MotionPath.ComponentPath;
   import motion._MotionPath.RotationPath;
   
   public class MotionPath
   {
      
      public var _y:ComponentPath;
      
      public var _x:ComponentPath;
      
      public var _rotation:RotationPath;
      
      public function MotionPath()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _x = new ComponentPath();
         _y = new ComponentPath();
         _rotation = null;
      }
      
      public function line(param1:Number, param2:Number, param3:Number = 1) : MotionPath
      {
         return bezierN(param1,param2,[],[],param3);
      }
      
      public function get_y() : IComponentPath
      {
         return _y;
      }
      
      public function get_x() : IComponentPath
      {
         return _x;
      }
      
      public function get_rotation() : RotationPath
      {
         if(_rotation == null)
         {
            _rotation = new RotationPath(_x,_y);
         }
         return _rotation;
      }
      
      public function bezierSpline(param1:Array, param2:Array, param3:Number = 1) : MotionPath
      {
         _x.addPath(new BezierSplinePath(param1,param3));
         _y.addPath(new BezierSplinePath(param2,param3));
         return this;
      }
      
      public function bezierN(param1:Number, param2:Number, param3:Array, param4:Array, param5:Number = 1) : MotionPath
      {
         _x.addPath(new BezierPath(param1,param3,param5));
         _y.addPath(new BezierPath(param2,param4,param5));
         return this;
      }
      
      public function bezier(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number = 1) : MotionPath
      {
         return bezierN(param1,param2,[param3],[param4],param5);
      }
   }
}

