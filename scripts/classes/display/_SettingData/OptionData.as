package classes.display._SettingData
{
   import classes.display.SettingParams;
   import coc.view.ButtonData;
   import flash.Boot;
   
   public class OptionData
   {
      
      public var onSelect:Function;
      
      public var name:String;
      
      public var isSet:Boolean;
      
      public var description:String;
      
      public var buttonData:ButtonData;
      
      public function OptionData(param1:SettingParams = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         isSet = false;
         name = param1.name;
         onSelect = param1.fun;
         description = param1.desc;
         isSet = param1.current;
         buttonData = new ButtonData(name,onSelect).disableIf(isSet);
      }
   }
}

