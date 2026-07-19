package classes
{
   import flash.Boot;
   
   public class SettingsGlobalDisplay
   {
      
      public var time12Hour:Boolean;
      
      public var textBackground:int;
      
      public var sprites:int;
      
      public var showHotkeys:Boolean;
      
      public var oldFont:Boolean;
      
      public var metric:Boolean;
      
      public var lastTheme:String;
      
      public var images:Boolean;
      
      public var fontSize:int;
      
      public var autoLoadTheme:Boolean;
      
      public var animateStatBars:Boolean;
      
      public function SettingsGlobalDisplay(param1:Object = undefined, param2:String = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         showHotkeys = false;
         oldFont = false;
         animateStatBars = true;
         metric = false;
         time12Hour = false;
         images = false;
         sprites = 0;
         fontSize = 20;
         textBackground = 0;
         lastTheme = "Default";
         autoLoadTheme = false;
         if(param1 != null)
         {
            autoLoadTheme = param1;
         }
         if(param2 != null)
         {
            lastTheme = param2;
         }
         if(param3 != null)
         {
            textBackground = param3;
         }
         if(param4 != null)
         {
            fontSize = param4;
         }
         if(param5 != null)
         {
            sprites = param5;
         }
         if(param6 != null)
         {
            images = param6;
         }
         if(param7 != null)
         {
            time12Hour = param7;
         }
         if(param8 != null)
         {
            metric = param8;
         }
         if(param9 != null)
         {
            animateStatBars = param9;
         }
         if(param10 != null)
         {
            oldFont = param10;
         }
         if(param11 != null)
         {
            showHotkeys = param11;
         }
      }
   }
}

