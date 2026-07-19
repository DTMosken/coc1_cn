package lime.app
{
   import flash.Boot;
   import haxe.Exception;
   
   public class Future
   {
      
      public var value:Object;
      
      public var isError:Boolean;
      
      public var isComplete:Boolean;
      
      public var error:*;
      
      public var __progressListeners:Array;
      
      public var __errorListeners:Array;
      
      public var __completeListeners:Array;
      
      public function Future(param1:Object = undefined, param2:Boolean = false)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param1 != null)
         {
            try
            {
               value = param1();
               isComplete = true;
            }
            catch(_loc_e_:*)
            {
            }
         }
      }
      
      public static function ofEvents(param1:_Event_ofEvents_T_Void, param2:_Event_Dynamic_Void = undefined, param3:_Event_Int_Int_Void = undefined) : Future
      {
         var _loc4_:Promise = new Promise();
         param1.add(_loc4_.complete,true);
         if(param2 != null)
         {
            param2.add(_loc4_.error,true);
         }
         if(param3 != null)
         {
            param3.add(_loc4_.progress,true);
         }
         return _loc4_.future;
      }
      
      public static function withError(param1:*) : Future
      {
         var _loc2_:Future = new Future();
         _loc2_.isError = true;
         _loc2_.error = param1;
         return _loc2_;
      }
      
      public static function withValue(param1:Object) : Future
      {
         var _loc2_:Future = new Future();
         _loc2_.isComplete = true;
         _loc2_.value = param1;
         return _loc2_;
      }
      
      public function then(param1:Function) : Future
      {
         var promise:Promise;
         var next:Function;
         var _loc2_:* = null as Future;
         next = param1;
         if(isComplete)
         {
            return next(value);
         }
         if(isError)
         {
            _loc2_ = new Future();
            _loc2_.isError = true;
            _loc2_.error = error;
            return _loc2_;
         }
         promise = new Promise();
         onError(promise.error);
         onProgress(promise.progress);
         onComplete(function(param1:Object):void
         {
            var _loc2_:Future = next(param1);
            _loc2_.onError(promise.error);
            _loc2_.onComplete(promise.complete);
         });
         return promise.future;
      }
      
      public function result(param1:int = -1) : Object
      {
         ready(param1);
         if(isComplete)
         {
            return value;
         }
         return null;
      }
      
      public function ready(param1:int = -1) : Future
      {
         return this;
      }
      
      public function onProgress(param1:Function) : Future
      {
         if(param1 != null)
         {
            if(__progressListeners == null)
            {
               __progressListeners = [];
            }
            __progressListeners.push(param1);
         }
         return this;
      }
      
      public function onError(param1:Function) : Future
      {
         if(param1 != null)
         {
            if(isError)
            {
               param1(error);
            }
            else if(!isComplete)
            {
               if(__errorListeners == null)
               {
                  __errorListeners = [];
               }
               __errorListeners.push(param1);
            }
         }
         return this;
      }
      
      public function onComplete(param1:Function) : Future
      {
         if(param1 != null)
         {
            if(isComplete)
            {
               param1(value);
            }
            else if(!isError)
            {
               if(__completeListeners == null)
               {
                  __completeListeners = [];
               }
               __completeListeners.push(param1);
            }
         }
         return this;
      }
   }
}

