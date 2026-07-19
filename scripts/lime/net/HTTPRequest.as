package lime.net
{
   import flash.Boot;
   import lime.net._HTTPRequest.AbstractHTTPRequest;
   
   public class HTTPRequest extends AbstractHTTPRequest
   {
      
      public function HTTPRequest(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
   }
}

