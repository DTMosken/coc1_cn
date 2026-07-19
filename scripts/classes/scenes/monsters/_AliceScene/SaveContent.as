package classes.scenes.monsters._AliceScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var trystOrTreatedYear:int;
      
      public var rented:Boolean;
      
      public var knowInnocent:Boolean;
      
      public var knowBossy:Boolean;
      
      public var foxWatched:Boolean;
      
      public var foxSeen:Boolean;
      
      public var foxNeedArouse:Boolean;
      
      public var akkySeen:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         trystOrTreatedYear = 0;
         akkySeen = false;
         knowBossy = false;
         knowInnocent = false;
         rented = false;
         foxNeedArouse = true;
         foxWatched = false;
         foxSeen = false;
         if(param1 != null)
         {
            foxSeen = param1;
         }
         if(param2 != null)
         {
            foxWatched = param2;
         }
         if(param3 != null)
         {
            foxNeedArouse = param3;
         }
         if(param4 != null)
         {
            rented = param4;
         }
         if(param5 != null)
         {
            knowInnocent = param5;
         }
         if(param6 != null)
         {
            knowBossy = param6;
         }
         if(param7 != null)
         {
            akkySeen = param7;
         }
         if(param8 != null)
         {
            trystOrTreatedYear = param8;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("foxSeen","",new BoolComponent(foxSeen,function(param1:Boolean):Boolean
         {
            return _gthis.foxSeen = param1;
         })),new DebugComp("foxWatched","",new BoolComponent(foxWatched,function(param1:Boolean):Boolean
         {
            return _gthis.foxWatched = param1;
         })),new DebugComp("foxNeedArouse","",new BoolComponent(foxNeedArouse,function(param1:Boolean):Boolean
         {
            return _gthis.foxNeedArouse = param1;
         })),new DebugComp("rented","",new BoolComponent(rented,function(param1:Boolean):Boolean
         {
            return _gthis.rented = param1;
         })),new DebugComp("knowInnocent","",new BoolComponent(knowInnocent,function(param1:Boolean):Boolean
         {
            return _gthis.knowInnocent = param1;
         })),new DebugComp("knowBossy","",new BoolComponent(knowBossy,function(param1:Boolean):Boolean
         {
            return _gthis.knowBossy = param1;
         })),new DebugComp("akkySeen","",new BoolComponent(akkySeen,function(param1:Boolean):Boolean
         {
            return _gthis.akkySeen = param1;
         })),new DebugComp("trystOrTreatedYear","",new IntComponent(trystOrTreatedYear,function(param1:int):int
         {
            return _gthis.trystOrTreatedYear = param1;
         }))];
      }
   }
}

