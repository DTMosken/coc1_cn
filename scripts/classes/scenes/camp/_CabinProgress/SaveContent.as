package classes.scenes.camp._CabinProgress
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public static var __meta__:* = {"fields":{
         "foundWood":{"hint":["遭遇过一次场景"]},
         "calledKiha":{"hint":["搞笑模式场景"]}
      }};
      
      public var foundWood:Boolean;
      
      public var calledKiha:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         calledKiha = false;
         foundWood = false;
         if(param1 != null)
         {
            foundWood = param1;
         }
         if(param2 != null)
         {
            calledKiha = param2;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foundWood","遭遇过一次场景",new BoolComponent(foundWood,function(param1:Boolean):Boolean
         {
            return _gthis.foundWood = param1;
         })),new DebugComp("calledKiha","搞笑模式场景",new BoolComponent(calledKiha,function(param1:Boolean):Boolean
         {
            return _gthis.calledKiha = param1;
         }))];
      }
   }
}

