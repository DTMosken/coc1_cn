package classes.scenes.npcs.pets
{
   import flash.Boot;
   
   public class PetLocation
   {
      
      public var visibleFrom:Array;
      
      public var texts:Array;
      
      public var descript:String;
      
      public function PetLocation(param1:Array = undefined, param2:Array = undefined, param3:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         texts = param1;
         visibleFrom = param2;
         descript = param3;
      }
   }
}

