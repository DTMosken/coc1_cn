package haxe.iterators
{
   import flash.Boot;
   
   public class ArrayKeyValueIterator
   {
      
      public var current:int;
      
      public var array:Array;
      
      public function ArrayKeyValueIterator(param1:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         current = 0;
         array = param1;
      }
      
      public function next() : Object
      {
         var _temp_4:* = "value";
         var _temp_3:* = array[current];
         var _temp_2:* = "key";
         var _loc1_:int;
         current = (_loc1_ = current) + 1;
         return {
            _temp_4:_temp_3,
            _temp_2:_loc1_
         };
      }
      
      public function hasNext() : Boolean
      {
         return current < int(array.length);
      }
   }
}

