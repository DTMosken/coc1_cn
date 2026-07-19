package lime.net._HTTPRequest
{
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import lime._internal.backend.flash.FlashHTTPRequest;
   import lime.app.Future;
   import lime.net._IHTTPRequest;
   
   public class AbstractHTTPRequest implements _IHTTPRequest
   {
      
      public var withCredentials:Boolean;
      
      public var userAgent:String;
      
      public var uri:String;
      
      public var timeout:int;
      
      public var responseStatus:int;
      
      public var responseHeaders:Array;
      
      public var responseData:Object;
      
      public var method:String;
      
      public var manageCookies:Boolean;
      
      public var headers:Array;
      
      public var formData:IMap;
      
      public var followRedirects:Boolean;
      
      public var enableResponseHeaders:Boolean;
      
      public var data:Bytes;
      
      public var contentType:String;
      
      public var __backend:FlashHTTPRequest;
      
      public function AbstractHTTPRequest(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         uri = param1;
         contentType = "application/x-www-form-urlencoded";
         followRedirects = true;
         enableResponseHeaders = false;
         formData = new StringMap();
         headers = [];
         method = "GET";
         timeout = 30000;
         withCredentials = false;
         manageCookies = true;
         __backend = new FlashHTTPRequest();
         __backend.init(this);
      }
      
      public function load(param1:String = undefined) : Future
      {
         return null;
      }
      
      public function cancel() : void
      {
         __backend.cancel();
      }
   }
}

