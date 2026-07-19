package classes._StatusEffect
{
   import flash.Boot;
   
   public class DataStore
   {
      
      public var weaponID:String;
      
      public var updateString:String;
      
      public var removeString:String;
      
      public var hipRatingChange:Object;
      
      public var duration:Object;
      
      public function DataStore(param1:Object = undefined, param2:String = undefined, param3:String = undefined, param4:Object = undefined, param5:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         duration = param1;
         removeString = param2;
         updateString = param3;
         hipRatingChange = param4;
         weaponID = param5;
      }
   }
}

