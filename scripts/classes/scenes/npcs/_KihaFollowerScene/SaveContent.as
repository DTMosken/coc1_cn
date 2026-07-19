package classes.scenes.npcs._KihaFollowerScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var wakeUp:Boolean;
      
      public var kidFirebreathing:Boolean;
      
      public var flowerGifted:Boolean;
      
      public var badCookingTasted:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         wakeUp = false;
         kidFirebreathing = false;
         flowerGifted = false;
         badCookingTasted = 0;
         if(param1 != null)
         {
            badCookingTasted = param1;
         }
         if(param2 != null)
         {
            flowerGifted = param2;
         }
         if(param3 != null)
         {
            kidFirebreathing = param3;
         }
         if(param4 != null)
         {
            wakeUp = param4;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("badCookingTasted","",new Combo(badCookingTasted,function(param1:int):int
         {
            return _gthis.badCookingTasted = param1;
         },{
            "label":"0",
            "value":0
         },{
            "label":"1",
            "value":1
         },{
            "label":"2",
            "value":2
         },{
            "label":"3",
            "value":3
         })),new DebugComp("flowerGifted","",new BoolComponent(flowerGifted,function(param1:Boolean):Boolean
         {
            return _gthis.flowerGifted = param1;
         })),new DebugComp("kidFirebreathing","",new BoolComponent(kidFirebreathing,function(param1:Boolean):Boolean
         {
            return _gthis.kidFirebreathing = param1;
         }))];
      }
   }
}

