package classes.items.undergarments._NobleShirt
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var unequipTried:Boolean;
      
      public var transformDay:int;
      
      public var rathazulEvent:Boolean;
      
      public var rathazulAsked:Boolean;
      
      public var izmaAsked:Boolean;
      
      public var isSoftReset:Boolean;
      
      public var gretaDidDispell:Boolean;
      
      public var gretaBoughtUnbindDay:int;
      
      public var gretaBoughtUnbind:Boolean;
      
      public var facePlant:Boolean;
      
      public var enchanted:Boolean;
      
      public var ceraphLeftIt:Boolean;
      
      public var ceraphAsked:Boolean;
      
      public var campDay:int;
      
      public var burnEvent:Boolean;
      
      public var bound:Boolean;
      
      public var armorStage:int;
      
      public var arianDisenchantDay:int;
      
      public var arianDisenchant:Boolean;
      
      public var arianAsked:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined, param18:Object = undefined, param19:Object = undefined, param20:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         isSoftReset = true;
         arianDisenchantDay = 0;
         arianDisenchant = false;
         arianAsked = false;
         gretaBoughtUnbindDay = 0;
         gretaBoughtUnbind = false;
         gretaDidDispell = false;
         ceraphLeftIt = false;
         ceraphAsked = false;
         izmaAsked = false;
         rathazulAsked = false;
         facePlant = false;
         rathazulEvent = false;
         burnEvent = false;
         transformDay = 0;
         campDay = 0;
         unequipTried = false;
         bound = true;
         enchanted = true;
         armorStage = 1;
         if(param1 != null)
         {
            armorStage = param1;
         }
         if(param2 != null)
         {
            enchanted = param2;
         }
         if(param3 != null)
         {
            bound = param3;
         }
         if(param4 != null)
         {
            unequipTried = param4;
         }
         if(param5 != null)
         {
            campDay = param5;
         }
         if(param6 != null)
         {
            transformDay = param6;
         }
         if(param7 != null)
         {
            burnEvent = param7;
         }
         if(param8 != null)
         {
            rathazulEvent = param8;
         }
         if(param9 != null)
         {
            facePlant = param9;
         }
         if(param10 != null)
         {
            rathazulAsked = param10;
         }
         if(param11 != null)
         {
            izmaAsked = param11;
         }
         if(param12 != null)
         {
            ceraphAsked = param12;
         }
         if(param13 != null)
         {
            ceraphLeftIt = param13;
         }
         if(param14 != null)
         {
            gretaDidDispell = param14;
         }
         if(param15 != null)
         {
            gretaBoughtUnbind = param15;
         }
         if(param16 != null)
         {
            gretaBoughtUnbindDay = param16;
         }
         if(param17 != null)
         {
            arianAsked = param17;
         }
         if(param18 != null)
         {
            arianDisenchant = param18;
         }
         if(param19 != null)
         {
            arianDisenchantDay = param19;
         }
         if(param20 != null)
         {
            isSoftReset = param20;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("armorStage","",new IntComponent(armorStage,function(param1:int):int
         {
            return _gthis.armorStage = param1;
         })),new DebugComp("enchanted","",new BoolComponent(enchanted,function(param1:Boolean):Boolean
         {
            return _gthis.enchanted = param1;
         })),new DebugComp("bound","",new BoolComponent(bound,function(param1:Boolean):Boolean
         {
            return _gthis.bound = param1;
         })),new DebugComp("unequipTried","",new BoolComponent(unequipTried,function(param1:Boolean):Boolean
         {
            return _gthis.unequipTried = param1;
         })),new DebugComp("campDay","",new IntComponent(campDay,function(param1:int):int
         {
            return _gthis.campDay = param1;
         })),new DebugComp("transformDay","",new IntComponent(transformDay,function(param1:int):int
         {
            return _gthis.transformDay = param1;
         })),new DebugComp("burnEvent","",new BoolComponent(burnEvent,function(param1:Boolean):Boolean
         {
            return _gthis.burnEvent = param1;
         })),new DebugComp("rathazulEvent","",new BoolComponent(rathazulEvent,function(param1:Boolean):Boolean
         {
            return _gthis.rathazulEvent = param1;
         })),new DebugComp("facePlant","",new BoolComponent(facePlant,function(param1:Boolean):Boolean
         {
            return _gthis.facePlant = param1;
         })),new DebugComp("rathazulAsked","",new BoolComponent(rathazulAsked,function(param1:Boolean):Boolean
         {
            return _gthis.rathazulAsked = param1;
         })),new DebugComp("izmaAsked","",new BoolComponent(izmaAsked,function(param1:Boolean):Boolean
         {
            return _gthis.izmaAsked = param1;
         })),new DebugComp("ceraphAsked","",new BoolComponent(ceraphAsked,function(param1:Boolean):Boolean
         {
            return _gthis.ceraphAsked = param1;
         })),new DebugComp("ceraphLeftIt","",new BoolComponent(ceraphLeftIt,function(param1:Boolean):Boolean
         {
            return _gthis.ceraphLeftIt = param1;
         })),new DebugComp("gretaDidDispell","",new BoolComponent(gretaDidDispell,function(param1:Boolean):Boolean
         {
            return _gthis.gretaDidDispell = param1;
         })),new DebugComp("gretaBoughtUnbind","",new BoolComponent(gretaBoughtUnbind,function(param1:Boolean):Boolean
         {
            return _gthis.gretaBoughtUnbind = param1;
         })),new DebugComp("gretaBoughtUnbindDay","",new IntComponent(gretaBoughtUnbindDay,function(param1:int):int
         {
            return _gthis.gretaBoughtUnbindDay = param1;
         })),new DebugComp("arianAsked","",new BoolComponent(arianAsked,function(param1:Boolean):Boolean
         {
            return _gthis.arianAsked = param1;
         })),new DebugComp("arianDisenchant","",new BoolComponent(arianDisenchant,function(param1:Boolean):Boolean
         {
            return _gthis.arianDisenchant = param1;
         })),new DebugComp("arianDisenchantDay","",new IntComponent(arianDisenchantDay,function(param1:int):int
         {
            return _gthis.arianDisenchantDay = param1;
         })),new DebugComp("isSoftReset","",new BoolComponent(isSoftReset,function(param1:Boolean):Boolean
         {
            return _gthis.isSoftReset = param1;
         }))];
      }
   }
}

