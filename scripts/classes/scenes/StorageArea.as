package classes.scenes
{
   import flash.Boot;
   
   public class StorageArea
   {
      
      public var start:int;
      
      public var end:int;
      
      public var acceptable:Function;
      
      public function StorageArea(param1:int = 0, param2:int = 0, param3:Function = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         start = param1;
         end = param2;
         acceptable = param3;
      }
   }
}

