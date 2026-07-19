package openfl.utils._Dictionary
{
   import flash.utils.Dictionary;
   import haxe.iterators.MapKeyValueIterator;
   
   public final class Dictionary_Impl_
   {
      
      public function Dictionary_Impl_()
      {
      }
      
      public static function _new(param1:Boolean = false) : Dictionary
      {
         return new Dictionary(param1);
      }
      
      public static function exists(param1:Dictionary, param2:Object) : Boolean
      {
         return param1[param2] != undefined;
      }
      
      public static function get(param1:Dictionary, param2:Object) : Object
      {
         return param1[param2];
      }
      
      public static function keyValueIterator(param1:Dictionary) : Object
      {
         return new MapKeyValueIterator(param1);
      }
      
      public static function remove(param1:Dictionary, param2:Object) : Boolean
      {
         var _loc3_:Boolean = param1[param2] != undefined;
         delete param1[param2];
         return _loc3_;
      }
      
      public static function set(param1:Dictionary, param2:Object, param3:Object) : Object
      {
         return param1[param2] = param3;
      }
      
      public static function iterator(param1:Dictionary) : Object
      {
         var _loc3_:* = 0;
         var _loc2_:Array = [];
         var _loc4_:* = param1;
         for(_loc3_ in _loc4_)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_.iterator();
      }
      
      public static function each(param1:Dictionary) : Object
      {
         var this1:Dictionary = param1;
         §§push("ref");
         §§push(this1);
         §§push("it");
         var _loc3_:* = 0;
         var _loc2_:Array = [];
         var _loc4_:* = this1;
         for(_loc3_ in _loc4_)
         {
            _loc2_.push(_loc3_);
         }
         return null;
      }
   }
}

