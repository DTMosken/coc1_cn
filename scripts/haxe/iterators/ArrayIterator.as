package haxe.iterators
{
   import flash.Boot;
   
   public class ArrayIterator
   {
      
      public var current:int;
      
      public var array:Array;
      
      public function ArrayIterator(param1:Array = undefined)
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
         var _temp_2:* = array;
         var _loc1_:int;
         current = (_loc1_ = current) + 1;
         return _temp_2[_loc1_];
      }
      
      public function hasNext() : Boolean
      {
         return current < int(array.length);
      }
   }
}

