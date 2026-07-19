package classes.scenes.npcs._JojoScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public static var __meta__:* = {"fields":{
         "forgiven":{"hint":["追踪他是否原谅了你试图强暴他的行为"]},
         "postRapeCampOffer":{"hint":["追踪你是否曾试图让他来营地"]}
      }};
      
      public var postRapeCampOffer:Boolean;
      
      public var forgiven:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         postRapeCampOffer = false;
         forgiven = false;
         if(param1 != null)
         {
            forgiven = param1;
         }
         if(param2 != null)
         {
            postRapeCampOffer = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("forgiven","追踪他是否原谅了你试图强暴他的行为",new BoolComponent(forgiven,function(param1:Boolean):Boolean
         {
            return _gthis.forgiven = param1;
         })),new DebugComp("postRapeCampOffer","追踪你是否曾试图让他来营地",new BoolComponent(postRapeCampOffer,function(param1:Boolean):Boolean
         {
            return _gthis.postRapeCampOffer = param1;
         }))];
      }
   }
}

