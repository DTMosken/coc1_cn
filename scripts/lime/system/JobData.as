package lime.system
{
   import flash.Boot;
   
   public class JobData
   {
      
      public static var nextID:int = 0;
      
      public var state:*;
      
      public var startTime:Number;
      
      public var id:int;
      
      public var duration:Number;
      
      public var doWork:Function;
      
      public function JobData(param1:Function = undefined, param2:* = undefined, param3:Object = undefined)
      {
         var _loc4_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         startTime = -1;
         duration = 0;
         var _temp_1:*;
         id = param3 != null ? int(param3) : (_temp_1 = JobData,_temp_1.nextID = (_loc4_ = int(_temp_1.nextID)) + 1,_loc4_);
         doWork = param1;
         state = param2;
      }
      
      public function get_started() : Boolean
      {
         return startTime >= 0;
      }
   }
}

