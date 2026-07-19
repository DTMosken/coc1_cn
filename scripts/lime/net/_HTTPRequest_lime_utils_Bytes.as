package lime.net
{
   import flash.Boot;
   import haxe.io.Bytes;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public class _HTTPRequest_lime_utils_Bytes extends _HTTPRequest_Bytes
   {
      
      public function _HTTPRequest_lime_utils_Bytes(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function fromBytes(param1:Bytes) : Object
      {
         return Bytes_Impl_.fromBytes(param1);
      }
   }
}

