package classes.scenes.areas.desert._ScorpionScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var talked:Boolean;
      
      public var state:int;
      
      public var fate:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         talked = false;
         fate = 0;
         state = 0;
         if(param1 != null)
         {
            state = param1;
         }
         if(param2 != null)
         {
            fate = param2;
         }
         if(param3 != null)
         {
            talked = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("state","蝎子的整体状态",new Combo(state,function(param1:int):int
         {
            return _gthis.state = param1;
         },{
            "label":"已禁用",
            "value":-1
         },{
            "label":"未遭遇",
            "value":0
         },{
            "label":"已遭遇",
            "value":1
         })),new DebugComp("fate","遭遇是如何结束的",new Combo(fate,function(param1:int):int
         {
            return _gthis.fate = param1;
         },{
            "label":"N/A",
            "value":0
         },{
            "label":"已杀死",
            "value":1
         },{
            "label":"已放过",
            "value":2
         },{
            "label":"跟随你",
            "value":3
         },{
            "label":"已骑乘",
            "value":4
         })),new DebugComp("talked","你是否尝试过与它交谈",new BoolComponent(talked,function(param1:Boolean):Boolean
         {
            return _gthis.talked = param1;
         }))];
      }
   }
}

