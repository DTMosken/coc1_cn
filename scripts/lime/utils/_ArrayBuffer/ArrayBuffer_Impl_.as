package lime.utils._ArrayBuffer
{
   import haxe.io.Bytes;
   import lime.utils.ArrayBufferView;
   
   public final class ArrayBuffer_Impl_
   {
      
      public function ArrayBuffer_Impl_()
      {
      }
      
      public static function get_byteLength(param1:Bytes) : int
      {
         return param1.length;
      }
      
      public static function _new(param1:int) : Bytes
      {
         return Bytes.alloc(param1);
      }
      
      public static function isView(param1:*) : Boolean
      {
         if(param1 != null)
         {
            return param1 is ArrayBufferView;
         }
         return false;
      }
      
      public static function slice(param1:Bytes, param2:int, param3:Object = undefined) : Bytes
      {
         var _loc5_:* = null as Bytes;
         if(param3 == null)
         {
            param3 = param1.length;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         if(param3 > param1.length)
         {
            param3 = param1.length;
         }
         var _loc4_:int = param3 - param2;
         if(param2 < 0 || _loc4_ <= 0)
         {
            return Bytes.alloc(0);
         }
         _loc5_ = Bytes.alloc(_loc4_);
         _loc5_.blit(0,param1,param2,_loc4_);
         return _loc5_;
      }
   }
}

