package coc.view
{
   import flash.Boot;
   
   public class LayoutHint
   {
      
      public var setWidth:Object;
      
      public var setHeight:Object;
      
      public var row:Object;
      
      public var ignore:Boolean;
      
      public var col:Object;
      
      public var before:int;
      
      public var after:int;
      
      public function LayoutHint(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         after = 0;
         before = 0;
         setHeight = null;
         setWidth = null;
         col = null;
         row = null;
         ignore = false;
         if(param1 != null)
         {
            ignore = param1;
         }
         if(param2 != null)
         {
            row = param2;
         }
         if(param3 != null)
         {
            col = param3;
         }
         if(param4 != null)
         {
            setWidth = param4;
         }
         if(param5 != null)
         {
            setHeight = param5;
         }
         if(param6 != null)
         {
            before = param6;
         }
         if(param7 != null)
         {
            after = param7;
         }
      }
   }
}

