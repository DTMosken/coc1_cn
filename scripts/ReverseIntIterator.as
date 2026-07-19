package
{
   import flash.Boot;
   
   public class ReverseIntIterator
   {
      
      public var i:int;
      
      public var end:int;
      
      public function ReverseIntIterator(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         i = param1;
         end = param2;
      }
      
      public static function reverse(param1:IntIterator) : ReverseIntIterator
      {
         return new ReverseIntIterator(param1.max - 1,param1.min);
      }
      
      public function next() : int
      {
         var _loc1_:int;
         i = (_loc1_ = i) - 1;
         return _loc1_;
      }
      
      public function hasNext() : Boolean
      {
         return i >= end;
      }
   }
}

