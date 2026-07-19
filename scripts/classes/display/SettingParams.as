package classes.display
{
   import flash.Boot;
   
   public class SettingParams
   {
      
      public var overridesLabel:Boolean;
      
      public var name:String;
      
      public var fun:Function;
      
      public var desc:String;
      
      public var current:Boolean;
      
      public function SettingParams(param1:String = undefined, param2:Function = undefined, param3:String = undefined, param4:Boolean = false, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         overridesLabel = false;
         name = param1;
         fun = param2;
         desc = param3;
         current = param4;
         if(param5 != null)
         {
            overridesLabel = param5;
         }
      }
   }
}

