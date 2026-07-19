package motion._MotionPath
{
   import flash.Boot;
   import motion.IComponentPath;
   
   public class ComponentPath implements IComponentPath
   {
      
      public var strength:Number;
      
      public var paths:Array;
      
      public function ComponentPath()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         paths = [];
         strength = 0;
      }
      
      public function set_start(param1:Number) : Number
      {
         if(int(paths.length) > 0)
         {
            return paths[0].set_start(param1);
         }
         return 0;
      }
      
      public function get_start() : Number
      {
         if(int(paths.length) > 0)
         {
            return paths[0].get_start();
         }
         return 0;
      }
      
      public function get_end() : Number
      {
         var _loc1_:* = null as IComponentPath;
         if(int(paths.length) > 0)
         {
            _loc1_ = paths[int(paths.length) - 1];
            return _loc1_.get_end();
         }
         return get_start();
      }
      
      public function calculate(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as IComponentPath;
         if(int(paths.length) == 1)
         {
            return paths[0].calculate(param1);
         }
         _loc2_ = param1 * strength;
         _loc3_ = 0;
         _loc4_ = paths;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc2_ - Number(_loc5_.strength) <= 1e-7)
            {
               return _loc5_.calculate(_loc2_ / Number(_loc5_.strength));
            }
            _loc2_ -= Number(_loc5_.strength);
         }
         return 0;
      }
      
      public function addPath(param1:IComponentPath) : void
      {
         if(int(paths.length) > 0)
         {
            param1.set_start(paths[int(paths.length) - 1].get_end());
         }
         paths.push(param1);
         strength += Number(param1.strength);
      }
   }
}

