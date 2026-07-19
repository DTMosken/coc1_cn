package lime.system
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.ds.List;
   
   public class WorkOutput
   {
      
      public var workIterations:Tls;
      
      public var mode:Boolean;
      
      public var __jobOutput:List;
      
      public var __jobComplete:Tls;
      
      public var __activeJob:Tls;
      
      public function WorkOutput(param1:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         __activeJob = new Tls();
         __jobComplete = new Tls();
         __jobOutput = new List();
         workIterations = new Tls();
         workIterations.value = 0;
         __jobComplete.value = false;
      }
      
      public function set_activeJob(param1:JobData) : JobData
      {
         return __activeJob.value = param1;
      }
      
      public function sendUncaughtError(param1:Exception) : void
      {
         if(!Boolean(__jobComplete.value))
         {
            __jobComplete.value = true;
            __jobOutput.add({
               "event":"UNCAUGHT_ERROR",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
      }
      
      public function sendThreadEvent(param1:Object, param2:Array = undefined) : void
      {
         __jobOutput.add(param1);
      }
      
      public function sendProgress(param1:* = undefined, param2:Array = undefined) : void
      {
         if(!Boolean(__jobComplete.value))
         {
            __jobOutput.add({
               "event":"PROGRESS",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
      }
      
      public function sendError(param1:* = undefined, param2:Array = undefined) : void
      {
         if(!Boolean(__jobComplete.value))
         {
            __jobComplete.value = true;
            __jobOutput.add({
               "event":"ERROR",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
      }
      
      public function sendComplete(param1:* = undefined, param2:Array = undefined) : void
      {
         if(!Boolean(__jobComplete.value))
         {
            __jobComplete.value = true;
            __jobOutput.add({
               "event":"COMPLETE",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
      }
      
      public function resetJobProgress() : void
      {
         __jobComplete.value = false;
         workIterations.value = 0;
      }
      
      public function get_activeJob() : JobData
      {
         return __activeJob.value;
      }
   }
}

