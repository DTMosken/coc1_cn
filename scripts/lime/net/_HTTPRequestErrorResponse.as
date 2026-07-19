package lime.net
{
   import flash.Boot;
   
   public class _HTTPRequestErrorResponse
   {
      
      public var responseData:Object;
      
      public var error:*;
      
      public function _HTTPRequestErrorResponse(param1:* = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         error = param1;
         responseData = param2;
      }
   }
}

