package classes._Saves
{
   import flash.Boot;
   
   public class StatusConversions
   {
      
      public var rathazul_mixologyXP:int;
      
      public var rathazul_metRathazul:Boolean;
      
      public var rathazul_campOffer:Boolean;
      
      public var rathazul_campFollower:Boolean;
      
      public function StatusConversions(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         rathazul_mixologyXP = 0;
         rathazul_campFollower = false;
         rathazul_campOffer = false;
         rathazul_metRathazul = false;
         if(param1 != null)
         {
            rathazul_metRathazul = param1;
         }
         if(param2 != null)
         {
            rathazul_campOffer = param2;
         }
         if(param3 != null)
         {
            rathazul_campFollower = param3;
         }
         if(param4 != null)
         {
            rathazul_mixologyXP = param4;
         }
      }
   }
}

