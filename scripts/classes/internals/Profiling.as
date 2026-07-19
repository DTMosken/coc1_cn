package classes.internals
{
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class Profiling
   {
      
      public static var init__:Boolean;
      
      public static var PF_COUNT:IMap;
      
      public static var PF_TIME:IMap;
      
      public static var PF_DEPTH:int = 0;
      
      public static var PF_NAME:Array = [];
      
      public static var PF_START:Array = [];
      
      public static var PF_ARGS:Array = [];
      
      public function Profiling()
      {
      }
      
      public static function shouldProfile(param1:String, param2:String) : Boolean
      {
         return true;
      }
      
      public static function shouldReportProfiling(param1:String, param2:String, param3:Number, param4:int) : Boolean
      {
         return param3 > 100;
      }
      
      public static function LogProfilingReport() : void
      {
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as String;
         var _loc14_:* = null as String;
         var _loc15_:* = null as String;
         var _loc16_:* = null as StringMap;
         var _loc17_:int = 0;
         var _loc18_:* = null as StringMap;
         var _loc19_:Number = NaN;
         var _loc1_:StringMap = Profiling.PF_COUNT;
         var _loc2_:* = _loc1_.h;
         var _loc3_:* = _loc1_.rh;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:* = _loc2_;
         var _loc7_:int = _loc4_;
         var _loc8_:Boolean = §§hasnext(_loc6_,_loc7_);
         if(!_loc8_ && _loc3_ != null)
         {
            _loc2_ = _loc3_;
            _loc6_ = _loc2_;
            _loc4_ = 0;
            _loc7_ = _loc4_;
            _loc3_ = null;
            _loc5_ = true;
            _loc8_ = §§hasnext(_loc6_,_loc7_);
         }
         var _loc9_:int = _loc7_;
         while(true)
         {
            _loc10_ = _loc2_;
            _loc11_ = _loc4_;
            _loc12_ = §§hasnext(_loc10_,_loc11_);
            if(!_loc12_ && _loc3_ != null)
            {
               _loc2_ = _loc3_;
               _loc10_ = _loc2_;
               _loc4_ = 0;
               _loc11_ = _loc4_;
               _loc3_ = null;
               _loc5_ = true;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
            }
            _loc9_ = _loc11_;
            if(!_loc12_)
            {
               break;
            }
            _loc13_ = §§nextname(_loc9_,_loc2_);
            _loc4_ = _loc9_;
            if(_loc5_)
            {
               _loc13_ = _loc13_.substr(1);
            }
            _loc14_ = _loc13_;
            _loc15_ = "[PROFILE] ";
            _loc15_ += _loc14_;
            _loc16_ = Profiling.PF_COUNT;
            _loc17_ = int(_loc14_ in StringMap.reserved ? _loc16_.getReserved(_loc14_) : _loc16_.h[_loc14_]);
            _loc15_ += "，被调用了" + _loc17_ + "次";
            _loc18_ = Profiling.PF_TIME;
            _loc19_ = Number(_loc14_ in StringMap.reserved ? _loc18_.getReserved(_loc14_) : _loc18_.h[_loc14_]);
            _loc15_ += "，总时间";
            if(_loc19_ > 10000)
            {
               _loc15_ += Math.floor(_loc19_ / 1000) + "s";
            }
            else
            {
               _loc15_ += _loc19_ + "ms";
            }
            if(_loc19_ > 0 && _loc17_ > 0)
            {
               _loc15_ += "，平均时间" + Std.string(_loc19_ / _loc17_) + "ms";
            }
         }
      }
      
      public static function Begin(param1:String, param2:String, ... rest) : void
      {
         if(!Profiling.shouldProfile(param1,param2))
         {
            return;
         }
         param2 = param1 + "." + param2;
         Profiling.PF_NAME[Profiling.PF_DEPTH] = param2;
         Profiling.PF_START[Profiling.PF_DEPTH] = Date.now().getTime();
         Profiling.PF_ARGS[Profiling.PF_DEPTH] = rest.copy();
         var _loc5_:StringMap = Profiling.PF_COUNT;
         var _loc6_:int = ((param2 in StringMap.reserved ? _loc5_.getReserved(param2) : _loc5_.h[param2]) | 0) + 1;
         var _loc7_:StringMap = Profiling.PF_COUNT;
         if(param2 in StringMap.reserved)
         {
            _loc7_.setReserved(param2,_loc6_);
         }
         else
         {
            _loc7_.h[param2] = _loc6_;
         }
         _temp_1.PF_DEPTH += 1;
      }
      
      public static function End(param1:String, param2:String) : void
      {
         var _loc7_:* = null as StringMap;
         var _loc8_:Number = NaN;
         var _loc9_:* = null as StringMap;
         var _loc12_:* = null as String;
         var _loc13_:int = 0;
         if(!Profiling.shouldProfile(param1,param2))
         {
            return;
         }
         var _loc3_:String = param2;
         param2 = param1 + "." + param2;
         var _loc4_:Number = Date.now().getTime();
         --Profiling.PF_DEPTH;
         while(Profiling.PF_DEPTH >= 0 && Profiling.PF_NAME[Profiling.PF_DEPTH] != param2)
         {
            --Profiling.PF_DEPTH;
         }
         if(Profiling.PF_DEPTH < 0)
         {
            Profiling.PF_DEPTH = 0;
            return;
         }
         var _loc5_:Number = _loc4_ - Number(Profiling.PF_START[Profiling.PF_DEPTH]);
         var _loc6_:StringMap = Profiling.PF_TIME;
         if(!(param2 in StringMap.reserved ? _loc6_.existsReserved(param2) : param2 in _loc6_.h))
         {
            _loc7_ = Profiling.PF_TIME;
            if(param2 in StringMap.reserved)
            {
               _loc7_.setReserved(param2,0);
            }
            else
            {
               _loc7_.h[param2] = 0;
            }
         }
         _loc7_ = Profiling.PF_TIME;
         _loc8_ = (param2 in StringMap.reserved ? _loc7_.getReserved(param2) : _loc7_.h[param2]) + _loc5_;
         _loc9_ = Profiling.PF_TIME;
         if(param2 in StringMap.reserved)
         {
            _loc9_.setReserved(param2,_loc8_);
         }
         else
         {
            _loc9_.h[param2] = _loc8_;
         }
         _loc7_ = Profiling.PF_COUNT;
         var _loc10_:int = int(param2 in StringMap.reserved ? _loc7_.getReserved(param2) : _loc7_.h[param2]);
         var _loc11_:Array = Profiling.PF_ARGS[Profiling.PF_DEPTH];
         if(Profiling.shouldReportProfiling(param1,_loc3_,_loc5_,_loc10_))
         {
            _loc12_ = "[PROFILE] ";
            _loc13_ = Profiling.PF_DEPTH;
            while(_loc13_-- > 0)
            {
               _loc12_ += "  ";
            }
            _loc12_ += param2;
            if(int(_loc11_.length) > 0)
            {
               _loc12_ += "(" + _loc11_.join(", ") + ")";
            }
            _loc12_ += "" + _loc5_ + "ms";
            if(_loc10_ > 1)
            {
               _loc12_ += "，被调用了" + _loc10_ + "次";
               _loc9_ = Profiling.PF_TIME;
               _loc8_ = Number(param2 in StringMap.reserved ? _loc9_.getReserved(param2) : _loc9_.h[param2]);
               if(_loc8_ > 0)
               {
                  _loc12_ += "，总时间";
                  if(_loc8_ > 10000)
                  {
                     _loc12_ += Math.floor(_loc8_ / 1000) + "s";
                  }
                  else
                  {
                     _loc12_ += _loc8_ + "ms";
                  }
                  _loc12_ += "，平均时间" + Std.string(_loc8_ / _loc10_) + "ms";
               }
            }
         }
      }
   }
}

