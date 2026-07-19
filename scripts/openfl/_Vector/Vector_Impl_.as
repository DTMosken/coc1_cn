package openfl._Vector
{
   public final class Vector_Impl_
   {
      
      public function Vector_Impl_()
      {
      }
      
      public static function _new(param1:Object = undefined, param2:Object = undefined, param3:Array = undefined) : Object
      {
         var _loc4_:* = null as Object;
         var _loc5_:* = null as Object;
         var _loc6_:* = null as Object;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param3 != null)
         {
            if(param3 == null)
            {
               _loc5_ = null;
               return _loc5_;
            }
            throw "Cannot create Vector without knowing runtime type";
         }
         if(param1 == null)
         {
            param1 = 0;
         }
         if(param2 == null)
         {
            param2 = false;
         }
         throw "Cannot create Vector without knowing runtime type";
      }
      
      public static function concat(param1:Object, param2:Object = undefined) : Object
      {
         if(param2 == null)
         {
            return param1.concat();
         }
         return param1.concat(param2);
      }
      
      public static function copy(param1:Object) : Object
      {
         var _loc5_:int = 0;
         throw "Cannot create Vector without knowing runtime type";
      }
      
      public static function filter(param1:Object, param2:Function) : Object
      {
         var _loc6_:int = 0;
         throw "Cannot create Vector without knowing runtime type";
      }
      
      public static function indexOf(param1:Object, param2:Object, param3:int = 0) : int
      {
         return int(param1.indexOf(param2,param3));
      }
      
      public static function insertAt(param1:Object, param2:int, param3:Object) : void
      {
         param1.insertAt(param2,param3);
      }
      
      public static function iterator(param1:Object) : Object
      {
         return new VectorDataIterator(param1);
      }
      
      public static function join(param1:Object, param2:String = undefined) : String
      {
         if(param2 == null)
         {
            param2 = ",";
         }
         return param1.join(param2);
      }
      
      public static function lastIndexOf(param1:Object, param2:Object, param3:int = 2147483647) : int
      {
         return int(param1.lastIndexOf(param2,param3));
      }
      
      public static function pop(param1:Object) : Object
      {
         return param1.pop();
      }
      
      public static function push(param1:Object, param2:Object) : int
      {
         return int(param1.push(param2));
      }
      
      public static function removeAt(param1:Object, param2:int) : Object
      {
         return param1.removeAt(param2);
      }
      
      public static function reverse(param1:Object) : Object
      {
         return param1.reverse();
      }
      
      public static function shift(param1:Object) : Object
      {
         return param1.shift();
      }
      
      public static function slice(param1:Object, param2:int = 0, param3:Object = undefined) : Object
      {
         if(param3 == null)
         {
            param3 = 16777215;
         }
         return param1.slice(param2,param3);
      }
      
      public static function sort(param1:Object, param2:Function) : void
      {
         param1.sort(param2);
      }
      
      public static function splice(param1:Object, param2:int, param3:int) : Object
      {
         return param1.splice(param2,param3);
      }
      
      public static function toString(param1:Object) : String
      {
         if(param1 != null)
         {
            return "[" + param1.toString() + "]";
         }
         return null;
      }
      
      public static function unshift(param1:Object, param2:Object) : void
      {
         param1.unshift(param2);
      }
      
      public static function ofArray(param1:Array) : Object
      {
         var _loc5_:int = 0;
         if(param1 == null)
         {
            return null;
         }
         throw "Cannot create Vector without knowing runtime type";
      }
      
      public static function ofValues(... rest) : Object
      {
         var _loc6_:int = 0;
         throw "Cannot create Vector without knowing runtime type";
      }
      
      public static function convert(param1:Object) : Object
      {
         return Vector.<Object>(param1);
      }
      
      public static function get(param1:Object, param2:int) : Object
      {
         return param1[param2];
      }
      
      public static function set(param1:Object, param2:int, param3:Object) : Object
      {
         return param1[param2] = param3;
      }
      
      public static function fromHaxeVector(param1:Object) : Object
      {
         return param1;
      }
      
      public static function toHaxeVector(param1:Object) : Object
      {
         return param1;
      }
      
      public static function fromVectorData(param1:Object) : Object
      {
         return param1;
      }
      
      public static function toVectorData(param1:Object) : Object
      {
         return param1;
      }
      
      public static function get_fixed(param1:Object) : Boolean
      {
         return param1.fixed;
      }
      
      public static function set_fixed(param1:Object, param2:Boolean) : Boolean
      {
         return param1.fixed = param2;
      }
      
      public static function get_length(param1:Object) : int
      {
         return int(param1.length);
      }
      
      public static function set_length(param1:Object, param2:int) : int
      {
         return param1.length = param2;
      }
   }
}

