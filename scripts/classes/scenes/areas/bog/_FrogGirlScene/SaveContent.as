package classes.scenes.areas.bog._FrogGirlScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var taughtLesson:int;
      
      public var submissive:Boolean;
      
      public var shownKids:int;
      
      public var pattyCake:Boolean;
      
      public var metSuwako:Boolean;
      
      public var lastEncounter:int;
      
      public var fought:Boolean;
      
      public var eggCount:int;
      
      public var angryLosses:int;
      
      public var analMad:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         pattyCake = false;
         shownKids = 0;
         submissive = false;
         eggCount = 0;
         fought = false;
         angryLosses = 0;
         analMad = 0;
         lastEncounter = 0;
         metSuwako = false;
         taughtLesson = 0;
         if(param1 != null)
         {
            taughtLesson = param1;
         }
         if(param2 != null)
         {
            metSuwako = param2;
         }
         if(param3 != null)
         {
            lastEncounter = param3;
         }
         if(param4 != null)
         {
            analMad = param4;
         }
         if(param5 != null)
         {
            angryLosses = param5;
         }
         if(param6 != null)
         {
            fought = param6;
         }
         if(param7 != null)
         {
            eggCount = param7;
         }
         if(param8 != null)
         {
            submissive = param8;
         }
         if(param9 != null)
         {
            shownKids = param9;
         }
         if(param10 != null)
         {
            pattyCake = param10;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("taughtLesson","",new Combo(taughtLesson,function(param1:int):int
         {
            return _gthis.taughtLesson = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"已教导",
            "value":1
         },{
            "label":"受惊",
            "value":2
         },{
            "label":"已杀",
            "value":3
         })),new DebugComp("metSuwako","",new BoolComponent(metSuwako,function(param1:Boolean):Boolean
         {
            return _gthis.metSuwako = param1;
         })),new DebugComp("analMad","她被操屁股的次数；因成功怀孕而减少。",new IntComponent(analMad,function(param1:int):int
         {
            return _gthis.analMad = param1;
         })),new DebugComp("angryLosses","坏结局计数器。",new IntComponent(angryLosses,function(param1:int):int
         {
            return _gthis.angryLosses = param1;
         })),new DebugComp("fought","禁用顺从路线。",new BoolComponent(fought,function(param1:Boolean):Boolean
         {
            return _gthis.fought = param1;
         })),new DebugComp("eggCount","",new IntComponent(eggCount,function(param1:int):int
         {
            return _gthis.eggCount = param1;
         })),new DebugComp("submissive","",new BoolComponent(submissive,function(param1:Boolean):Boolean
         {
            return _gthis.submissive = param1;
         })),new DebugComp("shownKids","",new Combo(shownKids,function(param1:int):int
         {
            return _gthis.shownKids = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"已显示",
            "value":1
         },{
            "label":"已访问菜单",
            "value":2
         })),new DebugComp("pattyCake","",new BoolComponent(pattyCake,function(param1:Boolean):Boolean
         {
            return _gthis.pattyCake = param1;
         }))];
      }
   }
}

