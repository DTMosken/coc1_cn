package classes.scenes.npcs._EmberScene
{
   import coc.view.selfDebug.ArrayComponent_Int;
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var tuckedToday:int;
      
      public var newbornGender:int;
      
      public var learnedFeeding:Boolean;
      
      public var hatchedToday:int;
      
      public var flowerExplained:Boolean;
      
      public var eggArray:Array;
      
      public var birthTime:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Array = undefined, param6:Object = undefined, param7:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tuckedToday = 0;
         hatchedToday = 0;
         eggArray = [];
         learnedFeeding = false;
         birthTime = 0;
         newbornGender = 0;
         flowerExplained = false;
         if(param1 != null)
         {
            flowerExplained = param1;
         }
         if(param2 != null)
         {
            newbornGender = param2;
         }
         if(param3 != null)
         {
            birthTime = param3;
         }
         if(param4 != null)
         {
            learnedFeeding = param4;
         }
         if(param5 != null)
         {
            eggArray = param5;
         }
         if(param6 != null)
         {
            hatchedToday = param6;
         }
         if(param7 != null)
         {
            tuckedToday = param7;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("flowerExplained","",new BoolComponent(flowerExplained,function(param1:Boolean):Boolean
         {
            return _gthis.flowerExplained = param1;
         })),new DebugComp("newbornGender","",new Combo(newbornGender,function(param1:int):int
         {
            return _gthis.newbornGender = param1;
         },{
            "label":"无",
            "value":0
         },{
            "label":"男性",
            "value":1
         },{
            "label":"女性",
            "value":2
         },{
            "label":"扶她",
            "value":3
         })),new DebugComp("birthTime","",new IntComponent(birthTime,function(param1:int):int
         {
            return _gthis.birthTime = param1;
         })),new DebugComp("learnedFeeding","",new BoolComponent(learnedFeeding,function(param1:Boolean):Boolean
         {
            return _gthis.learnedFeeding = param1;
         })),new DebugComp("eggArray","",new ArrayComponent_Int(eggArray,function(param1:Array):Array
         {
            return _gthis.eggArray = param1;
         })),new DebugComp("hatchedToday","",new IntComponent(hatchedToday,function(param1:int):int
         {
            return _gthis.hatchedToday = param1;
         })),new DebugComp("tuckedToday","",new IntComponent(tuckedToday,function(param1:int):int
         {
            return _gthis.tuckedToday = param1;
         }))];
      }
   }
}

