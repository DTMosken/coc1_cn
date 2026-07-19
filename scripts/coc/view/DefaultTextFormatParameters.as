package coc.view
{
   import flash.Boot;
   import flash.text.TextFormat;
   
   public class DefaultTextFormatParameters extends TextFormat
   {
      
      public function DefaultTextFormatParameters(param1:String = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:String = undefined, param8:String = undefined, param9:String = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
   }
}

