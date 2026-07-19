package classes.scenes.dungeons
{
   import flash.Boot;
   
   public class MapData
   {
      
      public var name:String;
      
      public var map:Array;
      
      public function MapData(param1:String = undefined, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         name = param1;
         map = param2;
      }
   }
}

