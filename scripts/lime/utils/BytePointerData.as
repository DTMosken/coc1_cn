package lime.utils
{
   import flash.Boot;
   import haxe.io.Bytes;
   
   public class BytePointerData
   {
      
      public var offset:int;
      
      public var bytes:Bytes;
      
      public function BytePointerData(param1:Bytes = undefined, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bytes = param1;
         offset = param2;
      }
   }
}

