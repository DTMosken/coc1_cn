package openfl._Vector
{
   import flash.Boot;
   
   public class VectorDataIterator
   {
      
      public static var __meta__:* = {"obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]}};
      
      public var vectorData:Object;
      
      public var index:int;
      
      public function VectorDataIterator(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         index = 0;
         vectorData = param1;
      }
      
      public function next() : Object
      {
         var _temp_2:* = vectorData;
         var _loc1_:int;
         index = (_loc1_ = index) + 1;
         return _temp_2[_loc1_];
      }
      
      public function hasNext() : Boolean
      {
         return index < int(vectorData.length);
      }
   }
}

