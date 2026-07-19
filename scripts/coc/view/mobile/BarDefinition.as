package coc.view.mobile
{
   import coc.view.StatBarOptions;
   import flash.Boot;
   import haxe.IMap;
   
   public class BarDefinition
   {
      
      public var values:IMap;
      
      public var base:StatBarOptions;
      
      public function BarDefinition(param1:StatBarOptions = undefined, param2:IMap = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         base = param1;
         values = param2;
      }
   }
}

