package coc.view.mobile._MobileSettings
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class SaveData
   {
      
      public var useMobileUI:Boolean;
      
      public var fullscreen:Boolean;
      
      public var cutouts:Boolean;
      
      public function SaveData()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cutouts = true;
         fullscreen = true;
         useMobileUI = true;
      }
      
      public function reset() : void
      {
         useMobileUI = true;
         fullscreen = true;
         cutouts = true;
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(this,param2);
      }
   }
}

