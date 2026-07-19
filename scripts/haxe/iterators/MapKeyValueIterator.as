package haxe.iterators
{
   import flash.Boot;
   import haxe.IMap;
   
   public class MapKeyValueIterator
   {
      
      public var map:IMap;
      
      public var keys:Object;
      
      public function MapKeyValueIterator(param1:IMap = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         map = param1;
         keys = param1.keys();
      }
      
      public function next() : Object
      {
         var _loc1_:Object = keys.next();
         return {
            "value":map.get(_loc1_),
            "key":_loc1_
         };
      }
      
      public function hasNext() : Boolean
      {
         return Boolean(keys.hasNext());
      }
   }
}

