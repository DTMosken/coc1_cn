package classes.scenes.seasonal._Nieve
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
      
      public var weaponTalked:Boolean;
      
      public var virgin:Boolean;
      
      public var stage:int;
      
      public var seenSpear:Boolean;
      
      public var kidsPlayedSingular:Boolean;
      
      public var kidsPlayed:Boolean;
      
      public var guardCamp:Boolean;
      
      public var guardAsked:Boolean;
      
      public var gender:int;
      
      public var face:String;
      
      public var coalFound:Boolean;
      
      public var analVirgin:Boolean;
      
      public var age:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:String = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         analVirgin = true;
         virgin = true;
         kidsPlayedSingular = false;
         kidsPlayed = false;
         guardAsked = false;
         guardCamp = false;
         weaponTalked = false;
         seenSpear = false;
         coalFound = false;
         age = -1;
         face = "";
         gender = 0;
         stage = 0;
         if(param1 != null)
         {
            stage = param1;
         }
         if(param2 != null)
         {
            gender = param2;
         }
         if(param3 != null)
         {
            face = param3;
         }
         if(param4 != null)
         {
            age = param4;
         }
         if(param5 != null)
         {
            coalFound = param5;
         }
         if(param6 != null)
         {
            seenSpear = param6;
         }
         if(param7 != null)
         {
            weaponTalked = param7;
         }
         if(param8 != null)
         {
            guardCamp = param8;
         }
         if(param9 != null)
         {
            guardAsked = param9;
         }
         if(param10 != null)
         {
            kidsPlayed = param10;
         }
         if(param11 != null)
         {
            kidsPlayedSingular = param11;
         }
         if(param12 != null)
         {
            virgin = param12;
         }
         if(param13 != null)
         {
            analVirgin = param13;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("stage","",new IntComponent(stage,function(param1:int):int
         {
            return _gthis.stage = param1;
         })),new DebugComp("gender","",new Combo(gender,function(param1:int):int
         {
            return _gthis.gender = param1;
         },{
            "label":"无",
            "value":0
         },{
            "label":"男性",
            "value":1
         },{
            "label":"女性",
            "value":2
         })),new DebugComp("face","",new Combo(face,function(param1:String):String
         {
            return _gthis.face = param1;
         },{
            "label":"",
            "value":""
         },{
            "label":"煤炭",
            "value":"coal"
         },{
            "label":"宝石",
            "value":"gems"
         })),new DebugComp("age","",new Combo(age,function(param1:int):int
         {
            return _gthis.age = param1;
         },{
            "label":"未设置",
            "value":-1
         },{
            "label":"儿童",
            "value":1
         },{
            "label":"成人",
            "value":0
         })),new DebugComp("coalFound","",new BoolComponent(coalFound,function(param1:Boolean):Boolean
         {
            return _gthis.coalFound = param1;
         })),new DebugComp("seenSpear","",new BoolComponent(seenSpear,function(param1:Boolean):Boolean
         {
            return _gthis.seenSpear = param1;
         })),new DebugComp("weaponTalked","",new BoolComponent(weaponTalked,function(param1:Boolean):Boolean
         {
            return _gthis.weaponTalked = param1;
         })),new DebugComp("guardCamp","",new BoolComponent(guardCamp,function(param1:Boolean):Boolean
         {
            return _gthis.guardCamp = param1;
         })),new DebugComp("guardAsked","",new BoolComponent(guardAsked,function(param1:Boolean):Boolean
         {
            return _gthis.guardAsked = param1;
         })),new DebugComp("kidsPlayed","",new BoolComponent(kidsPlayed,function(param1:Boolean):Boolean
         {
            return _gthis.kidsPlayed = param1;
         })),new DebugComp("kidsPlayedSingular","",new BoolComponent(kidsPlayedSingular,function(param1:Boolean):Boolean
         {
            return _gthis.kidsPlayedSingular = param1;
         })),new DebugComp("virgin","",new BoolComponent(virgin,function(param1:Boolean):Boolean
         {
            return _gthis.virgin = param1;
         })),new DebugComp("analVirgin","",new BoolComponent(analVirgin,function(param1:Boolean):Boolean
         {
            return _gthis.analVirgin = param1;
         }))];
      }
   }
}

