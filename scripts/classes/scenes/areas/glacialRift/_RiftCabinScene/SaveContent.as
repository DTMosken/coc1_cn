package classes.scenes.areas.glacialRift._RiftCabinScene
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Combo;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var tookBloomers:Boolean;
      
      public var pictureBurned:Boolean;
      
      public var orgasmType:String;
      
      public var loliVersion:Boolean;
      
      public var encountered:Boolean;
      
      public var bloomersBurned:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:String = undefined, param6:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         loliVersion = false;
         orgasmType = "";
         tookBloomers = false;
         bloomersBurned = false;
         pictureBurned = false;
         encountered = false;
         if(param1 != null)
         {
            encountered = param1;
         }
         if(param2 != null)
         {
            pictureBurned = param2;
         }
         if(param3 != null)
         {
            bloomersBurned = param3;
         }
         if(param4 != null)
         {
            tookBloomers = param4;
         }
         if(param5 != null)
         {
            orgasmType = param5;
         }
         if(param6 != null)
         {
            loliVersion = param6;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("encountered","",new BoolComponent(encountered,function(param1:Boolean):Boolean
         {
            return _gthis.encountered = param1;
         })),new DebugComp("pictureBurned","",new BoolComponent(pictureBurned,function(param1:Boolean):Boolean
         {
            return _gthis.pictureBurned = param1;
         })),new DebugComp("bloomersBurned","",new BoolComponent(bloomersBurned,function(param1:Boolean):Boolean
         {
            return _gthis.bloomersBurned = param1;
         })),new DebugComp("tookBloomers","",new BoolComponent(tookBloomers,function(param1:Boolean):Boolean
         {
            return _gthis.tookBloomers = param1;
         })),new DebugComp("orgasmType","",new Combo(orgasmType,function(param1:String):String
         {
            return _gthis.orgasmType = param1;
         },{
            "label":"",
            "value":""
         },{
            "label":"肉棒",
            "value":"Dick"
         },{
            "label":"阴道",
            "value":"Vaginal"
         })),new DebugComp("loliVersion","如果你遇到了该场景的萝莉版本，则为True",new BoolComponent(loliVersion,function(param1:Boolean):Boolean
         {
            return _gthis.loliVersion = param1;
         }))];
      }
   }
}

