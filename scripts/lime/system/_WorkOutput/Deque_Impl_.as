package lime.system._WorkOutput
{
   import haxe.ds.List;
   
   public final class Deque_Impl_
   {
      
      public function Deque_Impl_()
      {
      }
      
      public static function _new() : List
      {
         return new List();
      }
      
      public static function pop(param1:List, param2:Boolean) : Object
      {
         return param1.pop();
      }
   }
}

