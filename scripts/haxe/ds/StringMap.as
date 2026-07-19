package haxe.ds
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds._StringMap.StringMapKeysIterator;
   
   public class StringMap implements IMap
   {
      
      public static var reserved:Object = {};
      
      public var rh:*;
      
      public var h:*;
      
      public function StringMap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         h = {};
      }
      
      public function setReserved(param1:String, param2:Object) : void
      {
         if(rh == null)
         {
            rh = {};
         }
         rh["$" + param1] = param2;
      }
      
      public function set(param1:Object, param2:Object) : void
      {
         var _loc3_:String = param1;
         if(_loc3_ in StringMap.reserved)
         {
            setReserved(_loc3_,param2);
         }
         else
         {
            h[_loc3_] = param2;
         }
      }
      
      public function remove(param1:String) : Boolean
      {
         if(param1 in StringMap.reserved)
         {
            param1 = "$" + param1;
            if(rh == null || !(param1 in rh))
            {
               return false;
            }
            delete rh[param1];
            return true;
         }
         if(!(param1 in h))
         {
            return false;
         }
         delete h[param1];
         return true;
      }
      
      public function keys() : Object
      {
         return new StringMapKeysIterator(h,rh);
      }
      
      public function getReserved(param1:String) : Object
      {
         if(rh == null)
         {
            return null;
         }
         return rh["$" + param1];
      }
      
      public function get(param1:Object) : Object
      {
         var _loc2_:String = param1;
         if(_loc2_ in StringMap.reserved)
         {
            return getReserved(_loc2_);
         }
         return h[_loc2_];
      }
      
      public function existsReserved(param1:String) : Boolean
      {
         if(rh == null)
         {
            return false;
         }
         return "$" + param1 in rh;
      }
   }
}

