package haxe.ds._ObjectMap
{
   import flash.Boot;
   
   public class NativeValueIterator
   {
      
      public var index:int;
      
      public var collection:*;
      
      public function NativeValueIterator()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         index = 0;
      }
      
      public function next() : *
      {
         var _loc1_:int = index;
         var _loc2_:* = §§nextvalue(_loc1_,collection);
         index = _loc1_;
         return _loc2_;
      }
      
      public function hasNext() : Boolean
      {
         var _loc1_:* = collection;
         var _loc2_:int = index;
         var _loc3_:Boolean = §§hasnext(_loc1_,_loc2_);
         collection = _loc1_;
         index = _loc2_;
         return _loc3_;
      }
   }
}

