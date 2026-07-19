package lime.system._ThreadPool
{
   import flash.Boot;
   import lime.system.JobData;
   
   public class JobArrayIterator
   {
      
      public var jobs:Array;
      
      public var index:int;
      
      public function JobArrayIterator(param1:Array = undefined, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         jobs = param1;
         index = param2;
      }
      
      public function next() : JobData
      {
         var _temp_2:* = jobs;
         var _loc1_:int;
         index = (_loc1_ = index) + 1;
         return _temp_2[_loc1_];
      }
      
      public function hasNext() : Boolean
      {
         return index < int(jobs.length);
      }
   }
}

