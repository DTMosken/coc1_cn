package
{
   import flash.Boot;
   
   public class StringTools
   {
      
      public function StringTools()
      {
      }
      
      public static function htmlEscape(param1:String, param2:Object = undefined) : String
      {
         var _loc6_:* = null as String;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:String = param1;
         while(_loc4_ < _loc5_.length)
         {
            _loc6_ = _loc5_;
            _loc7_ = _loc4_++;
            _loc8_ = int(_loc6_.charCodeAt(_loc7_));
            if(_loc8_ >= 55296 && _loc8_ <= 56319)
            {
               _loc8_ = _loc8_ - 55232 << 10 | int(_loc6_.charCodeAt(_loc7_ + 1)) & 0x03FF;
            }
            _loc9_ = _loc8_;
            if(_loc9_ >= 65536)
            {
               _loc4_++;
            }
            _loc10_ = _loc9_;
            switch(_loc10_)
            {
               case 34:
                  if(param2)
                  {
                     _loc3_ += "&quot;";
                  }
                  else
                  {
                     _loc3_ += _loc10_ < 65536 ? String["fromCharCode"](_loc10_) : Boot.fromCodePoint(_loc10_);
                  }
                  break;
               case 38:
                  _loc3_ += "&amp;";
                  break;
               case 39:
                  if(param2)
                  {
                     _loc3_ += "&#039;";
                  }
                  else
                  {
                     _loc3_ += _loc10_ < 65536 ? String["fromCharCode"](_loc10_) : Boot.fromCodePoint(_loc10_);
                  }
                  break;
               case 60:
                  _loc3_ += "&lt;";
                  break;
               case 62:
                  _loc3_ += "&gt;";
                  break;
               default:
                  _loc3_ += _loc10_ < 65536 ? String["fromCharCode"](_loc10_) : Boot.fromCodePoint(_loc10_);
            }
         }
         return _loc3_;
      }
      
      public static function startsWith(param1:String, param2:String) : Boolean
      {
         if(param1.length >= param2.length)
         {
            return param1.lastIndexOf(param2,0) == 0;
         }
         return false;
      }
      
      public static function endsWith(param1:String, param2:String) : Boolean
      {
         var _loc3_:int = param2.length;
         var _loc4_:int = param1.length;
         if(_loc4_ >= _loc3_)
         {
            return param1.indexOf(param2,_loc4_ - _loc3_) == _loc4_ - _loc3_;
         }
         return false;
      }
      
      public static function isSpace(param1:String, param2:int) : Boolean
      {
         var _loc3_:Object = param1.charCodeAt(param2);
         if(!(_loc3_ > 8 && _loc3_ < 14))
         {
            return _loc3_ == 32;
         }
         return true;
      }
      
      public static function ltrim(param1:String) : String
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_ && StringTools.isSpace(param1,_loc3_))
         {
            _loc3_++;
         }
         if(_loc3_ > 0)
         {
            return param1.substr(_loc3_,_loc2_ - _loc3_);
         }
         return param1;
      }
      
      public static function rtrim(param1:String) : String
      {
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_ && StringTools.isSpace(param1,_loc2_ - _loc3_ - 1))
         {
            _loc3_++;
         }
         if(_loc3_ > 0)
         {
            return param1.substr(0,_loc2_ - _loc3_);
         }
         return param1;
      }
      
      public static function trim(param1:String) : String
      {
         return StringTools.ltrim(StringTools.rtrim(param1));
      }
      
      public static function lpad(param1:String, param2:String, param3:int) : String
      {
         if(param2.length <= 0)
         {
            return param1;
         }
         var _loc4_:String = "";
         param3 -= param1.length;
         while(_loc4_.length < param3)
         {
            _loc4_ += Std.string(param2);
         }
         return _loc4_ + Std.string(param1);
      }
      
      public static function replace(param1:String, param2:String, param3:String) : String
      {
         return param1.split(param2).join(param3);
      }
      
      public static function hex(param1:int, param2:Object = undefined) : String
      {
         var _loc3_:uint = uint(param1);
         var _loc4_:String = _loc3_.toString(16);
         _loc4_ = _loc4_.toUpperCase();
         if(param2 != null)
         {
            while(_loc4_.length < param2)
            {
               _loc4_ = "0" + _loc4_;
            }
         }
         return _loc4_;
      }
   }
}

