package
{
   public class Lambda
   {
      
      public function Lambda()
      {
      }
      
      public static function has(param1:Object, param2:Object) : Boolean
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            if(_loc4_ == param2)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function exists(param1:Object, param2:Function) : Boolean
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            if(Boolean(param2(_loc4_)))
            {
               return true;
            }
         }
         return false;
      }
      
      public static function count(param1:Object, param2:Object = undefined) : int
      {
         var _loc4_:* = null;
         var _loc5_:* = null as Object;
         var _loc3_:int = 0;
         if(param2 == null)
         {
            _loc4_ = param1.iterator();
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               _loc3_++;
            }
         }
         else
         {
            _loc4_ = param1.iterator();
            while(Boolean(_loc4_.hasNext()))
            {
               _loc5_ = _loc4_.next();
               if(Boolean(param2(_loc5_)))
               {
                  _loc3_++;
               }
            }
         }
         return _loc3_;
      }
      
      public static function find(param1:Object, param2:Function) : Object
      {
         var _loc4_:* = null as Object;
         var _loc3_:* = param1.iterator();
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            if(Boolean(param2(_loc4_)))
            {
               return _loc4_;
            }
         }
         return null;
      }
   }
}

