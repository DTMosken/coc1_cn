package classes.items.armors._VineArmor
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import coc.view.selfDebug.StringComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var flowerColor:String;
      
      public var clothUsed:Boolean;
      
      public var armorStage:int;
      
      public var armorChange:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:String = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         clothUsed = false;
         flowerColor = "rose-red";
         armorStage = 1;
         armorChange = 0;
         if(param1 != null)
         {
            armorChange = param1;
         }
         if(param2 != null)
         {
            armorStage = param2;
         }
         if(param3 != null)
         {
            flowerColor = param3;
         }
         if(param4 != null)
         {
            clothUsed = param4;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("armorChange","",new IntComponent(armorChange,function(param1:int):int
         {
            return _gthis.armorChange = param1;
         })),new DebugComp("armorStage","",new IntComponent(armorStage,function(param1:int):int
         {
            return _gthis.armorStage = param1;
         })),new DebugComp("flowerColor","",new StringComponent(flowerColor,function(param1:String):String
         {
            return _gthis.flowerColor = param1;
         })),new DebugComp("clothUsed","",new BoolComponent(clothUsed,function(param1:Boolean):Boolean
         {
            return _gthis.clothUsed = param1;
         }))];
      }
   }
}

