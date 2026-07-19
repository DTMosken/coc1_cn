package coc.view
{
   import flash.Boot;
   import flash.display.BitmapData;
   
   [Embed(source="/_assets/320_coc.view.ButtonBackground5.png")]
   public class ButtonBackground5 extends BitmapData
   {
      
      public function ButtonBackground5(param1:int = 0, param2:int = 0, param3:Object = undefined, param4:Object = undefined)
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

