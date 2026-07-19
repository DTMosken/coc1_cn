package motion.actuators
{
   import flash.Boot;
   
   public class MethodActuator extends SimpleActuator
   {
      
      public var tweenProperties:*;
      
      public var currentParameters:Array;
      
      public function MethodActuator(param1:Object = undefined, param2:Number = 0, param3:* = undefined)
      {
         var _loc6_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         currentParameters = [];
         tweenProperties = {};
         super(param1,param2,param3);
         if(!Reflect.hasField(param3,"start"))
         {
            properties.start = [];
         }
         if(!Reflect.hasField(param3,"end"))
         {
            properties.end = properties.start;
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(properties.start.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            currentParameters.push(properties.start[_loc6_]);
         }
      }
      
      override public function update(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null as Array;
         super.update(param1);
         if(active && !paused)
         {
            _loc2_ = 0;
            _loc3_ = int(properties.start.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc2_++;
               currentParameters[_loc4_] = Reflect.field(tweenProperties,"param" + _loc4_);
            }
            _loc5_ = target;
            _loc6_ = currentParameters;
            if(_loc6_ == null)
            {
               _loc6_ = [];
            }
            _loc5_.apply(_loc5_,_loc6_);
         }
      }
      
      override public function initialize() : void
      {
         var _loc1_:* = null as PropertyDetails;
         var _loc2_:* = null as String;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(properties.start.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc2_ = "param" + _loc6_;
            _loc3_ = properties.start[_loc6_];
            tweenProperties[_loc2_] = _loc3_;
            if(Std.isOfType(_loc3_,Number) || Std.isOfType(_loc3_,int))
            {
               _loc1_ = new PropertyDetails(tweenProperties,_loc2_,_loc3_,Number(properties.end[_loc6_]) - _loc3_);
               propertyDetails.push(_loc1_);
            }
         }
         detailsLength = int(propertyDetails.length);
         initialized = true;
      }
      
      override public function complete(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null as Array;
         if(initialized)
         {
            _loc2_ = 0;
            _loc3_ = int(properties.start.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc2_++;
               currentParameters[_loc4_] = Reflect.field(tweenProperties,"param" + _loc4_);
            }
            _loc5_ = target;
            _loc6_ = currentParameters;
            if(_loc6_ == null)
            {
               _loc6_ = [];
            }
            _loc5_.apply(_loc5_,_loc6_);
         }
         super.complete(param1);
      }
      
      override public function apply() : void
      {
         var _loc1_:* = target;
         var _loc2_:Array = properties.end;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         _loc1_.apply(_loc1_,_loc2_);
      }
   }
}

