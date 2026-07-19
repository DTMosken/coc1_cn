package lime.system._ThreadPool
{
   import flash.Boot;
   import lime.system.JobData;
   
   public class JobArray
   {
      
      public var startIndex:int;
      
      public var jobs:Array;
      
      public function JobArray()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         startIndex = 0;
         jobs = [];
      }
      
      public function shift() : JobData
      {
         var _loc1_:JobData = jobs[startIndex];
         jobs[startIndex] = null;
         ++startIndex;
         if(startIndex >= int(jobs.length))
         {
            jobs.resize(0);
            startIndex = 0;
         }
         else if(startIndex >= 100)
         {
            jobs.splice(0,startIndex);
            startIndex = 0;
         }
         return _loc1_;
      }
      
      public function removeJob(param1:int) : JobData
      {
         var _loc4_:int = 0;
         var _loc5_:* = null as JobData;
         var _loc6_:int = 0;
         var _loc2_:int = startIndex;
         var _loc3_:int = int(jobs.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc5_ = jobs[_loc4_];
            if(_loc5_.id == param1)
            {
               if((_loc4_ - startIndex) * 2 <= int(jobs.length) - startIndex)
               {
                  _loc6_ = _loc4_;
                  while(_loc6_ > startIndex)
                  {
                     jobs[_loc6_] = jobs[_loc6_ - 1];
                     _loc6_--;
                  }
                  shift();
               }
               else
               {
                  jobs.splice(_loc4_,1);
               }
               return _loc5_;
            }
         }
         return null;
      }
      
      public function push(param1:JobData) : int
      {
         return int(jobs.push(param1));
      }
      
      public function iterator() : JobArrayIterator
      {
         return new JobArrayIterator(jobs,startIndex);
      }
      
      public function get_length() : int
      {
         return int(jobs.length) - startIndex;
      }
      
      public function getJob(param1:int) : JobData
      {
         var _loc4_:int = 0;
         var _loc2_:int = startIndex;
         var _loc3_:int = int(jobs.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            if(jobs[_loc4_].id == param1)
            {
               return jobs[_loc4_];
            }
         }
         return null;
      }
      
      public function first() : JobData
      {
         return jobs[startIndex];
      }
      
      public function clear() : void
      {
         jobs.resize(0);
         startIndex = 0;
      }
   }
}

