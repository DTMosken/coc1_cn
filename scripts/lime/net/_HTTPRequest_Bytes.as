package lime.net
{
   import flash.Boot;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.app.Promise;
   import lime.net._HTTPRequest.AbstractHTTPRequest;
   
   public class _HTTPRequest_Bytes extends AbstractHTTPRequest
   {
      
      public function _HTTPRequest_Bytes(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function load(param1:String = undefined) : Future
      {
         var promise:Promise;
         var _gthis:_HTTPRequest_Bytes = this;
         if(param1 != null)
         {
            uri = param1;
         }
         promise = new Promise();
         var _loc2_:Future = __backend.loadData(uri);
         _loc2_.onProgress(promise.progress);
         _loc2_.onError(function(param1:_HTTPRequestErrorResponse):void
         {
            _gthis.responseData = param1.responseData;
            promise.error(param1.error);
         });
         _loc2_.onComplete(function(param1:Bytes):void
         {
            _gthis.responseData = _gthis.fromBytes(param1);
            promise.complete(_gthis.responseData);
         });
         return promise.future;
      }
      
      public function fromBytes(param1:Bytes) : Object
      {
         return param1;
      }
   }
}

