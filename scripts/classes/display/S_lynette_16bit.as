package classes.display
{
   import flash.Boot;
   import flash.display.BitmapData;
   
   [Embed(source="/_assets/144_classes.display.S_lynette_16bit.png")]
   public class S_lynette_16bit extends BitmapData
   {
      
      public function S_lynette_16bit(param1:int = 0, param2:int = 0, param3:Object = undefined, param4:Object = undefined)
      {
         if(param3 == null)
         {
            param3 = true;
         }
         if(param4 == null)
         {
            param4 = -1;
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4);
      }
   }
}

