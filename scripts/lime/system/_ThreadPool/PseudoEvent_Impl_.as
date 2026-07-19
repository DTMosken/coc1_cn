package lime.system._ThreadPool
{
   import lime.system.ThreadPool;
   import lime.system.WorkOutput;
   
   public final class PseudoEvent_Impl_
   {
      
      public function PseudoEvent_Impl_()
      {
      }
      
      public static function get___listeners(param1:ThreadPool) : Array
      {
         return [];
      }
      
      public static function get___repeat(param1:ThreadPool) : Array
      {
         return [];
      }
      
      public static function add(param1:ThreadPool, param2:Function) : void
      {
         var callback:Function = param2;
         var callCallback:Function = function(param1:*, param2:WorkOutput):void
         {
            callback(param1);
         };
         param1.__doWork = callCallback;
      }
      
      public static function cancel(param1:ThreadPool) : void
      {
      }
      
      public static function dispatch(param1:ThreadPool) : void
      {
      }
      
      public static function has(param1:ThreadPool, param2:Function) : Boolean
      {
         return param1.__doWork != null;
      }
      
      public static function remove(param1:ThreadPool, param2:Function) : void
      {
         param1.__doWork = null;
      }
      
      public static function removeAll(param1:ThreadPool) : void
      {
         param1.__doWork = null;
      }
   }
}

