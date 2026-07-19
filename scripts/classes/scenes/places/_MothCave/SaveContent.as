package classes.scenes.places._MothCave
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
      
      public var tapestryTime:int;
      
      public var tapestryChange:int;
      
      public var goneCamping:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         goneCamping = false;
         tapestryTime = 0;
         tapestryChange = 0;
         if(param1 != null)
         {
            tapestryChange = param1;
         }
         if(param2 != null)
         {
            tapestryTime = param2;
         }
         if(param3 != null)
         {
            goneCamping = param3;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("tapestryChange","追踪西尔维娅挂毯的状态",new Combo(tapestryChange,function(param1:int):int
         {
            return _gthis.tapestryChange = param1;
         },{
            "label":"未见",
            "value":0
         },{
            "label":"已见",
            "value":1
         },{
            "label":"已变",
            "value":2
         })),new DebugComp("tapestryTime","追踪你看到挂毯后经过的时间",new IntComponent(tapestryTime,function(param1:int):int
         {
            return _gthis.tapestryTime = param1;
         })),new DebugComp("goneCamping","追踪你是否完成过营火场景",new BoolComponent(goneCamping,function(param1:Boolean):Boolean
         {
            return _gthis.goneCamping = param1;
         }))];
      }
   }
}

