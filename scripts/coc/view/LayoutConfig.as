package coc.view
{
   import flash.Boot;
   
   public class LayoutConfig
   {
      
      public var type:LayoutType;
      
      public var paddingTop:Object;
      
      public var paddingRight:Object;
      
      public var paddingLeft:Object;
      
      public var paddingCenter:Object;
      
      public var paddingBottom:Object;
      
      public var padding:int;
      
      public var ignoreHidden:Object;
      
      public function LayoutConfig(param1:LayoutType = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         paddingCenter = null;
         paddingBottom = null;
         paddingTop = null;
         paddingRight = null;
         paddingLeft = null;
         padding = 0;
         ignoreHidden = null;
         type = LayoutType.None;
         if(param1 != null)
         {
            type = param1;
         }
         if(param2 != null)
         {
            ignoreHidden = param2;
         }
         if(param3 != null)
         {
            padding = param3;
         }
         if(param4 != null)
         {
            paddingLeft = param4;
         }
         if(param5 != null)
         {
            paddingRight = param5;
         }
         if(param6 != null)
         {
            paddingTop = param6;
         }
         if(param7 != null)
         {
            paddingBottom = param7;
         }
         if(param8 != null)
         {
            paddingCenter = param8;
         }
      }
   }
}

