package classes.scenes.places.bazaar
{
   import flash.Boot;
   
   public class CockSockEntry
   {
      
      public var price:int;
      
      public var id:String;
      
      public var description:String;
      
      public var buttonText:String;
      
      public function CockSockEntry(param1:String = undefined, param2:String = undefined, param3:int = 0, param4:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buttonText = param1;
         id = param2;
         price = param3;
         description = param4;
      }
   }
}

