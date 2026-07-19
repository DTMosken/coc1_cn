package
{
   public class Reflect
   {
      
      public function Reflect()
      {
      }
      
      public static function hasField(param1:*, param2:String) : Boolean
      {
         return param1.hasOwnProperty(param2);
      }
      
      public static function field(param1:*, param2:String) : *
      {
         if(param1 != null && param2 in param1)
         {
            return param1[param2];
         }
         return null;
      }
      
      public static function getProperty(param1:*, param2:String) : *
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:String = "get_" + param2;
         if(_loc3_ in param1)
         {
            return param1[_loc3_]();
         }
         if(param2 in param1)
         {
            return param1[param2];
         }
         return null;
      }
      
      public static function setProperty(param1:*, param2:String, param3:*) : void
      {
         var _loc4_:String = "set_" + param2;
         if(_loc4_ in param1)
         {
            param1[_loc4_](param3);
         }
         else
         {
            param1[param2] = param3;
         }
      }
      
      public static function fields(param1:*) : Array
      {
         var _loc4_:* = null as String;
         if(param1 == null)
         {
            return [];
         }
         var _loc3_:Array = [];
         for(_loc4_ in param1)
         {
            if(param1.hasOwnProperty(_loc4_))
            {
               _loc3_.push(_loc4_);
            }
         }
         return _loc3_;
      }
      
      public static function isFunction(param1:*) : Boolean
      {
         return typeof param1 == "function";
      }
      
      public static function compare(param1:Object, param2:Object) : int
      {
         var _loc3_:* = param1;
         var _loc4_:* = param2;
         if(_loc3_ == _loc4_)
         {
            return 0;
         }
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         return -1;
      }
      
      public static function compareMethods(param1:*, param2:*) : Boolean
      {
         return param1 == param2;
      }
      
      public static function isEnumValue(param1:*) : Boolean
      {
         var _loc3_:* = null;
         try
         {
            return param1.__enum__ == true;
         }
         catch(_loc_e_:*)
         {
         }
      }
      
      public static function deleteField(param1:*, param2:String) : Boolean
      {
         if(param1.hasOwnProperty(param2) != true)
         {
            return false;
         }
         delete param1[param2];
         return true;
      }
      
      public static function makeVarArgs(param1:Function) : *
      {
         var f:Function = param1;
         return function(... rest):*
         {
            return f(rest);
         };
      }
   }
}

