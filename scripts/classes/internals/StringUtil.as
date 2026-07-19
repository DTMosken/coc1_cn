package classes.internals
{
   import _String.String_Impl_;
   
   public class StringUtil
   {
      
      public function StringUtil()
      {
      }
      
      public static function trim(param1:String) : String
      {
         if(param1 == null)
         {
            return "";
         }
         var _loc2_:int = 0;
         while(StringUtil.isWhitespace(param1.charAt(_loc2_)))
         {
            _loc2_++;
         }
         var _loc3_:int = param1.length - 1;
         while(StringUtil.isWhitespace(param1.charAt(_loc3_)))
         {
            _loc3_--;
         }
         if(_loc3_ >= _loc2_)
         {
            return param1.substring(_loc2_,_loc3_ + 1);
         }
         return "";
      }
      
      public static function trimArrayElements(param1:String, param2:String) : String
      {
         var _loc3_:* = null as Function;
         var _loc4_:* = null as Array;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         var _loc7_:* = null as String;
         if(param1 != null)
         {
            _loc3_ = StringTools.trim;
            _loc4_ = [];
            _loc5_ = 0;
            _loc6_ = param1.split(param2);
            while(_loc5_ < int(_loc6_.length))
            {
               _loc7_ = _loc6_[_loc5_];
               _loc5_++;
               _loc4_.push(_loc3_(_loc7_));
            }
            return _loc4_.join(param2);
         }
         return param1;
      }
      
      public static function isWhitespace(param1:String) : Boolean
      {
         var _loc2_:String = String["fromCharCode"](160);
         var _loc3_:String = String["fromCharCode"](8232);
         var _loc4_:String = String["fromCharCode"](8233);
         var _loc5_:String = String["fromCharCode"](12288);
         if(!(StringTools.isSpace(param1,0) || param1 == _loc2_ || param1 == _loc3_ || param1 == _loc4_))
         {
            return param1 == _loc5_;
         }
         return true;
      }
      
      public static function repeat(param1:String, param2:int) : String
      {
         var _loc6_:int = 0;
         if(param2 == 0)
         {
            return "";
         }
         var _loc3_:String = param1;
         var _loc4_:int = 1;
         var _loc5_:int = param2;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc3_ += param1;
         }
         return _loc3_;
      }
      
      public static function restrict(param1:String, param2:String) : String
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:uint = 0;
         if(param2 == null)
         {
            return param1;
         }
         if(param2 == "")
         {
            return "";
         }
         var _loc3_:Array = [];
         var _loc4_:int = param1.length;
         var _loc5_:int = 0;
         _loc6_ = _loc4_;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc8_ = uint(param1.charCodeAt(_loc7_));
            if(StringUtil.testCharacter(_loc8_,param2))
            {
               _loc3_.push(_loc8_);
            }
         }
         var _loc9_:Function = String_Impl_.fromCharCode;
         var _loc10_:Array = [];
         _loc5_ = 0;
         var _loc11_:Array = _loc3_;
         while(_loc5_ < int(_loc11_.length))
         {
            _loc6_ = int(_loc11_[_loc5_]);
            _loc5_++;
            _loc10_.push(_loc9_(_loc6_));
         }
         return _loc10_.join("");
      }
      
      public static function testCharacter(param1:uint, param2:String) : Boolean
      {
         var _loc9_:uint = 0;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = true;
         var _loc7_:uint = 0;
         var _loc8_:int = param2.length;
         if(_loc8_ > 0)
         {
            _loc9_ = uint(param2.charCodeAt(0));
            if(_loc9_ == 94)
            {
               _loc3_ = true;
            }
         }
         var _loc10_:int = 0;
         var _loc11_:int = _loc8_;
         while(_loc10_ < _loc11_)
         {
            _loc12_ = _loc10_++;
            _loc9_ = uint(param2.charCodeAt(_loc12_));
            _loc13_ = false;
            if(!_loc4_)
            {
               if(_loc9_ == 45)
               {
                  _loc5_ = true;
               }
               else if(_loc9_ == 94)
               {
                  _loc6_ = !_loc6_;
               }
               else if(_loc9_ == 92)
               {
                  _loc4_ = true;
               }
               else
               {
                  _loc13_ = true;
               }
            }
            else
            {
               _loc13_ = true;
               _loc4_ = false;
            }
            if(_loc13_)
            {
               if(_loc5_)
               {
                  if(_loc7_ <= param1 && param1 <= _loc9_)
                  {
                     _loc3_ = _loc6_;
                  }
                  _loc5_ = false;
                  _loc7_ = 0;
               }
               else
               {
                  if(param1 == _loc9_)
                  {
                     _loc3_ = _loc6_;
                  }
                  _loc7_ = _loc9_;
               }
            }
         }
         return _loc3_;
      }
   }
}

