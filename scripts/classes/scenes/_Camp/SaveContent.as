package classes.scenes._Camp
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import coc.view.selfDebug.StringComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var storageMoveAll:Boolean;
      
      public var skyDamage:int;
      
      public var hasBeenImpSleepRaped:Boolean;
      
      public var dummyName:String;
      
      public var dummyGender:int;
      
      public var dummyBuilt:Boolean;
      
      public var didSoakInABarrel:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:String = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         didSoakInABarrel = false;
         hasBeenImpSleepRaped = false;
         storageMoveAll = false;
         dummyName = "";
         dummyGender = 0;
         dummyBuilt = false;
         skyDamage = 0;
         if(param1 != null)
         {
            skyDamage = param1;
         }
         if(param2 != null)
         {
            dummyBuilt = param2;
         }
         if(param3 != null)
         {
            dummyGender = param3;
         }
         if(param4 != null)
         {
            dummyName = param4;
         }
         if(param5 != null)
         {
            storageMoveAll = param5;
         }
         if(param6 != null)
         {
            hasBeenImpSleepRaped = param6;
         }
         if(param7 != null)
         {
            didSoakInABarrel = param7;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("skyDamage","对天空造成的伤害量",new IntComponent(skyDamage,function(param1:int):int
         {
            return _gthis.skyDamage = param1;
         })),new DebugComp("dummyBuilt","假人建好了吗？",new BoolComponent(dummyBuilt,function(param1:Boolean):Boolean
         {
            return _gthis.dummyBuilt = param1;
         })),new DebugComp("dummyGender","假人的性别",new Combo(dummyGender,function(param1:int):int
         {
            return _gthis.dummyGender = param1;
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
         })),new DebugComp("dummyName","",new StringComponent(dummyName,function(param1:String):String
         {
            return _gthis.dummyName = param1;
         })),new DebugComp("storageMoveAll","",new BoolComponent(storageMoveAll,function(param1:Boolean):Boolean
         {
            return _gthis.storageMoveAll = param1;
         })),new DebugComp("didSoakInABarrel","",new BoolComponent(didSoakInABarrel,function(param1:Boolean):Boolean
         {
            return _gthis.didSoakInABarrel = param1;
         }))];
      }
   }
}

