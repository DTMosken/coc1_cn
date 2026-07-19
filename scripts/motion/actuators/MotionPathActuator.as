package motion.actuators
{
   import flash.Boot;
   import motion.IComponentPath;
   
   public class MotionPathActuator extends SimpleActuator
   {
      
      public function MotionPathActuator(param1:Object = undefined, param2:Number = 0, param3:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3);
      }
      
      override public function update(param1:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as PropertyDetails;
         var _loc9_:Boolean = false;
         var _loc10_:* = null as Object;
         var _loc11_:* = null as Object;
         var _loc12_:* = null;
         if(!paused)
         {
            _loc4_ = (param1 - timeOffset) / duration;
            if(_loc4_ > 1)
            {
               _loc4_ = 1;
            }
            if(!initialized)
            {
               initialize();
            }
            if(!special)
            {
               _loc3_ = _ease.calculate(_loc4_);
               _loc5_ = 0;
               _loc6_ = propertyDetails;
               while(_loc5_ < int(_loc6_.length))
               {
                  _loc7_ = _loc6_[_loc5_];
                  _loc5_++;
                  if(_loc7_.isField)
                  {
                     _loc7_.target[_loc7_.propertyName] = _loc7_.path.calculate(_loc3_);
                  }
                  else
                  {
                     Reflect.setProperty(_loc7_.target,_loc7_.propertyName,_loc7_.path.calculate(_loc3_));
                  }
               }
            }
            else
            {
               if(!_reverse)
               {
                  _loc3_ = _ease.calculate(_loc4_);
               }
               else
               {
                  _loc3_ = _ease.calculate(1 - _loc4_);
               }
               _loc5_ = 0;
               _loc6_ = propertyDetails;
               while(_loc5_ < int(_loc6_.length))
               {
                  _loc7_ = _loc6_[_loc5_];
                  _loc5_++;
                  if(!_snapping)
                  {
                     if(_loc7_.isField)
                     {
                        _loc7_.target[_loc7_.propertyName] = _loc7_.path.calculate(_loc3_);
                     }
                     else
                     {
                        Reflect.setProperty(_loc7_.target,_loc7_.propertyName,_loc7_.path.calculate(_loc3_));
                     }
                  }
                  else if(_loc7_.isField)
                  {
                     _loc7_.target[_loc7_.propertyName] = int(Math.round(_loc7_.path.calculate(_loc3_)));
                  }
                  else
                  {
                     Reflect.setProperty(_loc7_.target,_loc7_.propertyName,int(Math.round(_loc7_.path.calculate(_loc3_))));
                  }
               }
            }
            if(_loc4_ == 1)
            {
               if(_repeat == 0)
               {
                  active = false;
                  if(toggleVisible)
                  {
                     _loc10_ = target;
                     _loc11_ = null;
                     if(Reflect.hasField(_loc10_,"alpha"))
                     {
                        _loc11_ = _loc10_["alpha"];
                     }
                     else
                     {
                        _loc11_ = Reflect.getProperty(_loc10_,"alpha");
                     }
                     _loc9_ = _loc11_ == 0;
                  }
                  else
                  {
                     _loc9_ = false;
                  }
                  if(_loc9_)
                  {
                     _loc10_ = target;
                     _loc12_ = false;
                     if(Reflect.hasField(_loc10_,"visible") && !_loc10_.hasOwnProperty("set_" + "visible"))
                     {
                        _loc10_["visible"] = _loc12_;
                     }
                     else
                     {
                        Reflect.setProperty(_loc10_,"visible",_loc12_);
                     }
                  }
                  complete(true);
                  return;
               }
               if(_onRepeat != null)
               {
                  _loc12_ = _onRepeat;
                  _loc6_ = _onRepeatParams;
                  if(_loc6_ == null)
                  {
                     _loc6_ = [];
                  }
                  _loc12_.apply(_loc12_,_loc6_);
               }
               if(_reflect)
               {
                  _reverse = !_reverse;
               }
               startTime = param1;
               timeOffset = startTime + _delay;
               if(_repeat > 0)
               {
                  --_repeat;
               }
            }
            if(sendChange)
            {
               change();
            }
         }
      }
      
      override public function initialize() : void
      {
         var _loc1_:* = null as PropertyPathDetails;
         var _loc2_:* = null as IComponentPath;
         var _loc5_:* = null as String;
         var _loc6_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Array = Reflect.fields(properties);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc2_ = Reflect.field(properties,_loc5_);
            if(_loc2_ != null)
            {
               _loc6_ = true;
               _loc6_ = false;
               _loc2_.set_start(Reflect.getProperty(target,_loc5_));
               _loc1_ = new PropertyPathDetails(target,_loc5_,_loc2_,_loc6_);
               propertyDetails.push(_loc1_);
            }
         }
         detailsLength = int(propertyDetails.length);
         initialized = true;
      }
      
      override public function apply() : void
      {
         var _loc3_:* = null as String;
         var _loc1_:int = 0;
         var _loc2_:Array = Reflect.fields(properties);
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            Reflect.setProperty(target,_loc3_,Reflect.field(properties,_loc3_).get_end());
         }
      }
   }
}

