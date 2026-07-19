package haxe.ds
{
   import flash.Boot;
   import flash.utils.Dictionary;
   import haxe.IMap;
   import haxe.ds._IntMap.IntMapKeysIterator;
   
   public class IntMap implements IMap
   {
      
      public var h:Dictionary;
      
      public function IntMap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         h = new Dictionary();
      }
      
      public function set(param1:Object, param2:Object) : void
      {
         var _loc3_:int = int(param1);
         h[_loc3_] = param2;
      }
      
      public function remove(param1:int) : Boolean
      {
         if(!(param1 in h))
         {
            return false;
         }
         delete h[param1];
         return true;
      }
      
      public function keys() : Object
      {
         return new IntMapKeysIterator(h);
      }
      
      public function get(param1:Object) : Object
      {
         var _loc2_:int = int(param1);
         return h[_loc2_];
      }
   }
}

