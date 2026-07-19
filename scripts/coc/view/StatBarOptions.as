package coc.view
{
   import flash.Boot;
   
   public class StatBarOptions
   {
      
      public var width:Object;
      
      public var value:Object;
      
      public var statName:String;
      
      public var showMax:Object;
      
      public var minValue:Object;
      
      public var minBarColor:Object;
      
      public var maxValue:Object;
      
      public var isUp:Object;
      
      public var isDown:Object;
      
      public var height:Object;
      
      public var hasShadow:Object;
      
      public var hasMinBar:Object;
      
      public var hasGauge:Object;
      
      public var hasBar:Object;
      
      public var bgColor:Object;
      
      public var barHeight:Object;
      
      public var barColor:Object;
      
      public var barAlpha:Object;
      
      public function StatBarOptions(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:String = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined, param18:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bgColor = null;
         minBarColor = null;
         barColor = null;
         barHeight = null;
         barAlpha = null;
         hasShadow = null;
         hasMinBar = null;
         hasBar = null;
         hasGauge = null;
         isDown = null;
         isUp = null;
         showMax = null;
         statName = null;
         value = null;
         maxValue = null;
         minValue = null;
         height = null;
         width = null;
         if(param1 != null)
         {
            width = param1;
         }
         if(param2 != null)
         {
            height = param2;
         }
         if(param3 != null)
         {
            minValue = param3;
         }
         if(param4 != null)
         {
            maxValue = param4;
         }
         if(param5 != null)
         {
            value = param5;
         }
         if(param6 != null)
         {
            statName = param6;
         }
         if(param7 != null)
         {
            showMax = param7;
         }
         if(param8 != null)
         {
            isUp = param8;
         }
         if(param9 != null)
         {
            isDown = param9;
         }
         if(param10 != null)
         {
            hasGauge = param10;
         }
         if(param11 != null)
         {
            hasBar = param11;
         }
         if(param12 != null)
         {
            hasMinBar = param12;
         }
         if(param13 != null)
         {
            hasShadow = param13;
         }
         if(param14 != null)
         {
            barAlpha = param14;
         }
         if(param15 != null)
         {
            barHeight = param15;
         }
         if(param16 != null)
         {
            barColor = param16;
         }
         if(param17 != null)
         {
            minBarColor = param17;
         }
         if(param18 != null)
         {
            bgColor = param18;
         }
      }
   }
}

