package lime.graphics.opengl
{
   import flash.Boot;
   
   public class GLObject
   {
      
      public var refs:Array;
      
      public var ptr:*;
      
      public var id:int;
      
      public function GLObject(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         id = param1;
      }
      
      public static function fromInt(param1:int, param2:int) : GLObject
      {
         if(param2 == 0)
         {
            return null;
         }
         return null;
      }
   }
}

