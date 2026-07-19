package haxe
{
   public class NativeStackTrace
   {
      
      public function NativeStackTrace()
      {
      }
      
      public static function toHaxe(param1:String, param2:int = 0) : Array
      {
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc9_:* = null as StackItem;
         var _loc3_:Array = [];
         var _loc4_:EReg = new EReg("at ([^/]+?)\\$?(/[^\\(]+)?\\(\\)(\\[(.*?):([0-9]+)\\])?","");
         var _loc5_:EReg = new EReg("^MethodInfo-([0-9]+)$","g");
         var _loc6_:int = 0;
         while(_loc4_.match(param1))
         {
            param1 = _loc4_.matchedRight();
            if(param2 <= _loc6_++)
            {
               _loc7_ = _loc4_.matched(1).split("::").join(".");
               _loc8_ = _loc4_.matched(2);
               if(_loc8_ == null)
               {
                  if(_loc5_.match(_loc7_))
                  {
                     _loc9_ = StackItem.LocalFunction(Std.parseInt(_loc5_.matched(1)));
                  }
                  else
                  {
                     _loc9_ = StackItem.Method(_loc7_,"new");
                  }
               }
               else
               {
                  _loc9_ = StackItem.Method(_loc7_,_loc8_.substring(1));
               }
               if(_loc4_.matched(3) != null)
               {
                  _loc9_ = StackItem.FilePos(_loc9_,_loc4_.matched(4),Std.parseInt(_loc4_.matched(5)));
               }
               _loc3_.push(_loc9_);
            }
         }
         return _loc3_;
      }
      
      public static function normalize(param1:String, param2:int = 0) : String
      {
         var _loc3_:String = param1.substring(0,6);
         while(true)
         {
            if(_loc3_ != "Error\n")
            {
               if(_loc3_ != "Error:")
               {
                  break;
               }
            }
            param2++;
            break;
         }
         return NativeStackTrace.skipLines(param1,param2);
      }
      
      public static function skipLines(param1:String, param2:int, param3:int = 0) : String
      {
         if(param2 > 0)
         {
            param3 = param1.indexOf("\n",param3);
            if(param3 < 0)
            {
               return "";
            }
            return NativeStackTrace.skipLines(param1,--param2,param3 + 1);
         }
         return param1.substring(param3);
      }
   }
}

