package classes.display
{
   import flash.Boot;
   
   public class Setting
   {
      
      public var options:Array;
      
      public var label:String;
      
      public function Setting(param1:String = undefined, param2:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         label = param1;
         options = param2;
      }
   }
}

