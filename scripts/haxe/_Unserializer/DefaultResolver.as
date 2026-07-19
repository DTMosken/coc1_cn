package haxe._Unserializer
{
   public class DefaultResolver
   {
      
      public function DefaultResolver()
      {
      }
      
      public function resolveEnum(param1:String) : Class
      {
         return Type.resolveEnum(param1);
      }
      
      public function resolveClass(param1:String) : Class
      {
         return Type.resolveClass(param1);
      }
   }
}

