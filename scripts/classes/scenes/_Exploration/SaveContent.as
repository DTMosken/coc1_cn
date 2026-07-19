package classes.scenes._Exploration
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var foundWagon:Boolean;
      
      public var foundUrtaHalberd:Boolean;
      
      public var foundSkeleton:Boolean;
      
      public var desertWaterNeeded:Boolean;
      
      public var cragWaterNeeded:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         cragWaterNeeded = false;
         desertWaterNeeded = false;
         foundUrtaHalberd = false;
         foundSkeleton = false;
         foundWagon = false;
         if(param1 != null)
         {
            foundWagon = param1;
         }
         if(param2 != null)
         {
            foundSkeleton = param2;
         }
         if(param3 != null)
         {
            foundUrtaHalberd = param3;
         }
         if(param4 != null)
         {
            desertWaterNeeded = param4;
         }
         if(param5 != null)
         {
            cragWaterNeeded = param5;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foundWagon","",new BoolComponent(foundWagon,function(param1:Boolean):Boolean
         {
            return _gthis.foundWagon = param1;
         })),new DebugComp("foundSkeleton","",new BoolComponent(foundSkeleton,function(param1:Boolean):Boolean
         {
            return _gthis.foundSkeleton = param1;
         })),new DebugComp("foundUrtaHalberd","",new BoolComponent(foundUrtaHalberd,function(param1:Boolean):Boolean
         {
            return _gthis.foundUrtaHalberd = param1;
         })),new DebugComp("desertWaterNeeded","",new BoolComponent(desertWaterNeeded,function(param1:Boolean):Boolean
         {
            return _gthis.desertWaterNeeded = param1;
         })),new DebugComp("cragWaterNeeded","",new BoolComponent(cragWaterNeeded,function(param1:Boolean):Boolean
         {
            return _gthis.cragWaterNeeded = param1;
         }))];
      }
   }
}

