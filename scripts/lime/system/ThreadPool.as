package lime.system
{
   import flash.Boot;
   import flash.utils.getTimer;
   import haxe.Exception;
   import lime.app.Application;
   import lime.app._Event_Dynamic_Void;
   import lime.app._Event_haxe_Exception_Void;
   import lime.app._Event_lime_system_State_Void;
   import lime.system._ThreadPool.JobArray;
   import lime.ui.Window;
   import lime.utils.Log;
   
   public class ThreadPool extends WorkOutput
   {
      
      public static var workLoad:Number = 0.5;
      
      public static var __totalWorkPriority:Number = 0;
      
      public var workPriority:Number;
      
      public var onUncaughtError:_Event_haxe_Exception_Void;
      
      public var onRun:_Event_lime_system_State_Void;
      
      public var onProgress:_Event_Dynamic_Void;
      
      public var onError:_Event_Dynamic_Void;
      
      public var onComplete:_Event_Dynamic_Void;
      
      public var minThreads:int;
      
      public var maxThreads:int;
      
      public var activeThreads:int;
      
      public var __singleThreadedJobs:JobArray;
      
      public var __singleThreadedJobRunning:Boolean;
      
      public var __idleThreads:int;
      
      public var __doWork:Function;
      
      public function ThreadPool(param1:int = 0, param2:int = 1, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         __singleThreadedJobs = new JobArray();
         __singleThreadedJobRunning = false;
         workPriority = 1;
         onUncaughtError = new _Event_haxe_Exception_Void();
         onRun = new _Event_lime_system_State_Void();
         onProgress = new _Event_Dynamic_Void();
         onError = new _Event_Dynamic_Void();
         onComplete = new _Event_Dynamic_Void();
         __idleThreads = 0;
         activeThreads = 0;
         super(param3);
         minThreads = param1;
         maxThreads = param2;
      }
      
      public static function isMainThread() : Boolean
      {
         return true;
      }
      
      public static function timestamp() : Number
      {
         return getTimer() / 1000;
      }
      
      public function set_workPriority(param1:Number) : Number
      {
         if(__singleThreadedJobRunning)
         {
            _temp_1.__totalWorkPriority += param1 - workPriority;
         }
         return workPriority = param1;
      }
      
      public function set___singleThreadedJobRunning(param1:Boolean) : Boolean
      {
         if(param1 != __singleThreadedJobRunning)
         {
            if(param1)
            {
               _temp_1.__totalWorkPriority += workPriority;
            }
            else
            {
               _temp_2.__totalWorkPriority -= workPriority;
            }
         }
         return __singleThreadedJobRunning = param1;
      }
      
      override public function sendProgress(param1:* = undefined, param2:Array = undefined) : void
      {
         var _loc3_:* = null as JobArray;
         if(Boolean(__jobComplete.value))
         {
            return;
         }
         _loc3_ = __singleThreadedJobs;
         if(__activeJob.value == _loc3_.jobs[_loc3_.startIndex])
         {
            __dispatchJobOutput({
               "event":"PROGRESS",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
         else
         {
            super.sendProgress(param1,param2);
         }
      }
      
      override public function sendError(param1:* = undefined, param2:Array = undefined) : void
      {
         var _loc3_:* = null as JobArray;
         if(Boolean(__jobComplete.value))
         {
            return;
         }
         _loc3_ = __singleThreadedJobs;
         if(__activeJob.value == _loc3_.jobs[_loc3_.startIndex])
         {
            __jobComplete.value = true;
            __dispatchJobOutput({
               "event":"ERROR",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
         else
         {
            super.sendError(param1,param2);
         }
      }
      
      override public function sendComplete(param1:* = undefined, param2:Array = undefined) : void
      {
         var _loc3_:* = null as JobArray;
         if(Boolean(__jobComplete.value))
         {
            return;
         }
         _loc3_ = __singleThreadedJobs;
         if(__activeJob.value == _loc3_.jobs[_loc3_.startIndex])
         {
            __jobComplete.value = true;
            __dispatchJobOutput({
               "event":"COMPLETE",
               "message":param1,
               "jobID":__activeJob.value.id
            });
         }
         else
         {
            super.sendComplete(param1,param2);
         }
      }
      
      public function run(param1:Object = undefined, param2:* = undefined, param3:Object = undefined) : int
      {
         if(param3 == null)
         {
            param3 = mode;
         }
         if(param1 == null)
         {
            if(__doWork == null)
            {
               throw Exception.thrown("run() requires doWork argument.");
            }
            param1 = __doWork;
         }
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:JobData = new JobData(param1,param2);
         __singleThreadedJobs.jobs.push(_loc4_);
         if(true != __singleThreadedJobRunning)
         {
            _temp_1.__totalWorkPriority += workPriority;
         }
         __singleThreadedJobRunning = true;
         if(Application.current != null && !Application.current.onUpdate.has(__update))
         {
            Application.current.onUpdate.add(__update);
         }
         return _loc4_.id;
      }
      
      public function queue(param1:Object = undefined, param2:* = undefined) : int
      {
         return run(param1,param2);
      }
      
      public function get_idleThreads() : int
      {
         return __idleThreads;
      }
      
      public function get_doWork() : ThreadPool
      {
         return this;
      }
      
      public function get_currentThreads() : int
      {
         return activeThreads + __idleThreads;
      }
      
      public function get_activeJobs() : int
      {
         var _loc1_:JobArray = __singleThreadedJobs;
         return activeThreads + (int(_loc1_.jobs.length) - _loc1_.startIndex > 0 ? 1 : 0);
      }
      
      public function cancelJob(param1:int) : Boolean
      {
         var _loc2_:* = null as JobArray;
         var _loc3_:Boolean = false;
         if(__singleThreadedJobs.removeJob(param1) != null)
         {
            _loc2_ = __singleThreadedJobs;
            _loc3_ = int(_loc2_.jobs.length) - _loc2_.startIndex > 0;
            if(_loc3_ != __singleThreadedJobRunning)
            {
               if(_loc3_)
               {
                  _temp_1.__totalWorkPriority += workPriority;
               }
               else
               {
                  _temp_2.__totalWorkPriority -= workPriority;
               }
            }
            __singleThreadedJobRunning = _loc3_;
            return true;
         }
         return false;
      }
      
      public function cancel(param1:* = undefined) : void
      {
         var _loc2_:* = null as JobArray;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         var _loc5_:* = null as JobData;
         if(param1 != null)
         {
            _loc2_ = __singleThreadedJobs;
            _loc3_ = _loc2_.jobs;
            _loc4_ = _loc2_.startIndex;
            while(_loc4_ < int(_loc3_.length))
            {
               _loc5_ = _loc3_[_loc4_++];
               __activeJob.value = _loc5_;
               onError.dispatch(param1);
            }
         }
         _loc2_ = __singleThreadedJobs;
         _loc2_.jobs.resize(0);
         _loc2_.startIndex = 0;
         if(false != __singleThreadedJobRunning)
         {
            _temp_1.__totalWorkPriority -= workPriority;
         }
         __singleThreadedJobRunning = false;
         __jobComplete.value = false;
         _loc5_ = null;
         __activeJob.value = _loc5_;
      }
      
      public function __update(param1:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:* = null as JobArray;
         var _loc7_:* = null as JobArray;
         var _loc8_:* = null;
         var _loc9_:* = null as Exception;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as JobData;
         var _loc12_:Boolean = false;
         var _loc3_:Number = getTimer() / 1000;
         if(ThreadPool.__totalWorkPriority > 0)
         {
            _loc4_ = 60;
            if(Application.current.__window != null)
            {
               _loc4_ = Application.current.__window.__backend.getFrameRate();
            }
            _loc3_ += ThreadPool.workLoad * workPriority / (_loc4_ * ThreadPool.__totalWorkPriority);
         }
         while(true)
         {
            _loc6_ = __singleThreadedJobs;
            if(int(_loc6_.jobs.length) - _loc6_.startIndex > 0)
            {
               _loc4_ = getTimer() / 1000;
               _loc5_ = _loc4_ < _loc3_;
            }
            else
            {
               _loc5_ = false;
            }
            if(!_loc5_)
            {
               break;
            }
            _loc7_ = __singleThreadedJobs;
            __activeJob.value = _loc7_.jobs[_loc7_.startIndex];
            if(__activeJob.value.startTime < 0)
            {
               __activeJob.value.startTime = _loc4_;
               onRun.dispatch(__activeJob.value.state);
            }
            __jobComplete.value = false;
            workIterations.value = 0;
            try
            {
               do
               {
                  var _temp_1:* = workIterations;
                  _temp_1.value = int(_temp_1.value) + 1;
                  __activeJob.value.doWork(__activeJob.value.state,this);
               }
               while(!__jobComplete.value && getTimer() / 1000 < _loc3_);
            }
            catch(_loc_e_:*)
            {
               _loc10_ = getTimer() / 1000;
               _temp_2.duration += _loc10_ - _loc4_;
               _loc11_ = null;
               __activeJob.value = _loc11_;
               if(Boolean(__jobComplete.value))
               {
                  __singleThreadedJobs.shift();
                  _loc7_ = __singleThreadedJobs;
                  _loc12_ = int(_loc7_.jobs.length) - _loc7_.startIndex > 0;
                  if(_loc12_ != __singleThreadedJobRunning)
                  {
                     if(_loc12_)
                     {
                        _temp_3.__totalWorkPriority += workPriority;
                     }
                     else
                     {
                        _temp_4.__totalWorkPriority -= workPriority;
                     }
                  }
                  __singleThreadedJobRunning = _loc12_;
               }
            }
         }
         while(true)
         {
            _loc8_ = __jobOutput.pop();
            if(_loc8_ == null)
            {
               break;
            }
            __dispatchJobOutput(_loc8_);
         }
         _loc6_ = __singleThreadedJobs;
         if(activeThreads + (int(_loc6_.jobs.length) - _loc6_.startIndex > 0 ? 1 : 0) <= 0)
         {
            Application.current.onUpdate.remove(__update);
         }
      }
      
      public function __dispatchJobOutput(param1:Object) : void
      {
         var _loc3_:* = null as JobData;
         var _loc4_:Boolean = false;
         var _loc6_:* = null as JobArray;
         var _loc8_:* = null as String;
         var _loc9_:int = 0;
         var _loc2_:JobData = __activeJob.value;
         _loc3_ = null;
         __activeJob.value = _loc3_;
         var _loc5_:JobArray = __singleThreadedJobs;
         if(int(_loc5_.jobs.length) - _loc5_.startIndex > 0)
         {
            _loc6_ = __singleThreadedJobs;
            _loc4_ = param1.jobID == _loc6_.jobs[_loc6_.startIndex].id;
         }
         else
         {
            _loc4_ = false;
         }
         if(_loc4_)
         {
            _loc6_ = __singleThreadedJobs;
            __activeJob.value = _loc6_.jobs[_loc6_.startIndex];
         }
         else if(param1.jobID != null)
         {
            __activeJob.value = _loc2_;
            return;
         }
         var _loc7_:String = param1.event;
         if(_loc7_ == "COMPLETE")
         {
            onComplete.dispatch(param1.message);
         }
         else if(_loc7_ == "ERROR")
         {
            onError.dispatch(param1.message);
         }
         else if(_loc7_ == "PROGRESS")
         {
            onProgress.dispatch(param1.message);
         }
         else if(_loc7_ == "UNCAUGHT_ERROR")
         {
            if(param1.message is Exception)
            {
               if(int(onUncaughtError.__listeners.length) > 0)
               {
                  onUncaughtError.dispatch(param1.message);
                  _loc8_ = null;
               }
               else
               {
                  _loc8_ = param1.message.details();
               }
            }
            else
            {
               _loc8_ = Std.string(param1.message);
            }
            if(_loc8_ != null)
            {
               _loc3_ = null;
               __activeJob.value = _loc3_;
               Log.error(_loc8_,{
                  "fileName":"lime/system/ThreadPool.hx",
                  "lineNumber":529,
                  "className":"lime.system.ThreadPool",
                  "methodName":"__dispatchJobOutput"
               });
            }
         }
         else if(_loc7_ == "WORK")
         {
            _loc9_ = getTimer();
            __activeJob.value.startTime = _loc9_ / 1000;
            onRun.dispatch(__activeJob.value.state);
         }
         __activeJob.value = _loc2_;
      }
   }
}

