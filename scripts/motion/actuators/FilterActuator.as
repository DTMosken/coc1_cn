package motion.actuators
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilter;
   
   public class FilterActuator extends SimpleActuator
   {
      
      public var filterIndex:int;
      
      public var filterClass:Class;
      
      public var filter:BitmapFilter;
      
      public function FilterActuator(param1:DisplayObject = undefined, param2:Number = 0, param3:* = undefined)
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as BitmapFilter;
         if(Boot.skip_constructor)
         {
            return;
         }
         filterIndex = -1;
         super(param1,param2,param3);
         if(Std.isOfType(param3.filter,Class))
         {
            filterClass = param3.filter;
            if(int(param1.filters.length) == 0)
            {
               param1.filters = [Type.createInstance(filterClass,[])];
            }
            _loc4_ = 0;
            _loc5_ = param1.filters;
            while(_loc4_ < int(_loc5_.length))
            {
               _loc6_ = _loc5_[_loc4_];
               _loc4_++;
               if(Std.isOfType(_loc6_,filterClass))
               {
                  filter = _loc6_;
               }
            }
         }
         else
         {
            filterIndex = param3.filter;
            filter = param1.filters[filterIndex];
         }
      }
      
      override public function update(param1:Number) : void
      {
         super.update(param1);
         setFilter();
      }
      
      public function setFilter() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = target.filters;
         if(filterIndex > -1)
         {
            _loc1_[filterIndex] = filter;
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = int(_loc1_.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc2_++;
               if(Std.isOfType(_loc1_[_loc4_],filterClass))
               {
                  _loc1_[_loc4_] = filter;
               }
            }
         }
         var _loc5_:DisplayObject = target;
         var _loc6_:* = _loc1_;
         if(Reflect.hasField(_loc5_,"filters") && !_loc5_.hasOwnProperty("set_" + "filters"))
         {
            _loc5_["filters"] = _loc6_;
         }
         else
         {
            Reflect.setProperty(_loc5_,"filters",_loc6_);
         }
      }
      
      override public function initialize() : void
      {
         var _loc1_:* = null as PropertyDetails;
         var _loc2_:Number = NaN;
         var _loc5_:* = null as String;
         var _loc6_:* = null as BitmapFilter;
         var _loc7_:* = null as Object;
         var _loc3_:int = 0;
         var _loc4_:Array = Reflect.fields(properties);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(_loc5_ != "filter")
            {
               _loc6_ = filter;
               _loc7_ = null;
               if(Reflect.hasField(_loc6_,_loc5_))
               {
                  _loc7_ = _loc6_[_loc5_];
               }
               else
               {
                  _loc7_ = Reflect.getProperty(_loc6_,_loc5_);
               }
               _loc2_ = _loc7_;
               _loc1_ = new PropertyDetails(filter,_loc5_,_loc2_,Reflect.field(properties,_loc5_) - _loc2_,Reflect.hasField(filter,"set_" + _loc5_));
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
            if(_loc3_ != "filter")
            {
               Reflect.setProperty(filter,_loc3_,Reflect.field(properties,_loc3_));
            }
         }
         setFilter();
      }
   }
}

