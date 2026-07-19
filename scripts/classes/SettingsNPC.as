package classes
{
   import flash.Boot;
   
   public class SettingsNPC
   {
      
      public var urtaDisabled:Boolean;
      
      public var shouldraChild:Boolean;
      
      public var lowStandards:Boolean;
      
      public var kidAYounger:Boolean;
      
      public var genericLoliShota:Boolean;
      
      public var gargoyleChild:Boolean;
      
      public function SettingsNPC(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         urtaDisabled = false;
         genericLoliShota = false;
         kidAYounger = false;
         shouldraChild = false;
         gargoyleChild = false;
         lowStandards = false;
         if(param1 != null)
         {
            lowStandards = param1;
         }
         if(param2 != null)
         {
            gargoyleChild = param2;
         }
         if(param3 != null)
         {
            shouldraChild = param3;
         }
         if(param4 != null)
         {
            kidAYounger = param4;
         }
         if(param5 != null)
         {
            genericLoliShota = param5;
         }
         if(param6 != null)
         {
            urtaDisabled = param6;
         }
      }
   }
}

