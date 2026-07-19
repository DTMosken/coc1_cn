package
{
   import flash.Boot;
   import haxe.Exception;
   
   public class EReg
   {
      
      public var result:*;
      
      public var r:RegExp;
      
      public function EReg(param1:String = undefined, param2:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         r = new RegExp(param1,param2);
      }
      
      public function split(param1:String) : Array
      {
         var _loc2_:String = "#__delim__#";
         var _loc3_:String = param1.replace(r,_loc2_);
         return _loc3_.split(_loc2_);
      }
      
      public function replace(param1:String, param2:String) : String
      {
         return param1.replace(r,param2);
      }
      
      public function matchedRight() : String
      {
         if(result == null)
         {
            throw Exception.thrown("No string matched");
         }
         var _loc1_:int = int(result.index) + result[0].length;
         var _loc2_:String = result.input;
         return _loc2_.substr(_loc1_,_loc2_.length - _loc1_);
      }
      
      public function matchedPos() : Object
      {
         if(result == null)
         {
            throw Exception.thrown("No string matched");
         }
         return {
            "pos":int(result.index),
            "len":result[0].length
         };
      }
      
      public function matchedLeft() : String
      {
         if(result == null)
         {
            throw Exception.thrown("No string matched");
         }
         var _loc1_:String = result.input;
         return _loc1_.substr(0,result.index);
      }
      
      public function matched(param1:int) : String
      {
         if(result != null && param1 >= 0 && param1 < int(result.length))
         {
            return result[param1];
         }
         throw Exception.thrown("EReg::matched");
      }
      
      public function matchSub(param1:String, param2:int, param3:int = -1) : Boolean
      {
         var _loc4_:Boolean = false;
         if(r.global)
         {
            r.lastIndex = param2;
            result = r.exec(param3 < 0 ? param1 : param1.substr(0,param2 + param3));
            _loc4_ = result != null;
            if(_loc4_)
            {
               result.input = param1;
            }
            return _loc4_;
         }
         _loc4_ = match(param3 < 0 ? param1.substr(param2) : param1.substr(param2,param3));
         if(_loc4_)
         {
            result.input = param1;
            var _temp_1:* = result;
            _temp_1.index = _temp_1.index + param2;
         }
         return _loc4_;
      }
      
      public function match(param1:String) : Boolean
      {
         if(r.global)
         {
            r.lastIndex = 0;
         }
         result = r.exec(param1);
         return result != null;
      }
      
      public function map(param1:String, param2:Function) : String
      {
         var _loc6_:* = null;
         var _loc3_:int = 0;
         var _loc4_:String = "";
         var _loc5_:Boolean = true;
         while(_loc3_ < param1.length)
         {
            if(!matchSub(param1,_loc3_))
            {
               _loc4_ += Std.string(param1.substr(_loc3_));
               break;
            }
            _loc6_ = matchedPos();
            _loc4_ += Std.string(param1.substr(_loc3_,int(_loc6_.pos) - _loc3_));
            _loc4_ += Std.string(param2(this));
            if(int(_loc6_.len) == 0)
            {
               _loc4_ += Std.string(param1.substr(int(_loc6_.pos),1));
               _loc3_ = int(_loc6_.pos) + 1;
            }
            else
            {
               _loc3_ = int(_loc6_.pos) + int(_loc6_.len);
            }
            _loc5_ = false;
            if(!r.global)
            {
               break;
            }
         }
         if(!r.global && _loc3_ > 0 && _loc3_ < param1.length)
         {
            _loc4_ += Std.string(param1.substr(_loc3_));
         }
         return _loc4_;
      }
   }
}

