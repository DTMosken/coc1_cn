package classes.scenes.places.bazaar._Telly
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.FloatComponent;
   import coc.view.selfDebug.IntComponent;
   import coc.view.selfDebug.StringComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var vesTelly:int;
      
      public var tellyTubby:String;
      
      public var tellyTimer:Number;
      
      public var tellyPlasmed:Boolean;
      
      public var tellyOphile:*;
      
      public var tellyGraph:String;
      
      public var tellyGram:int;
      
      public var tellyGenesis:Boolean;
      
      public var tellyCommute:Boolean;
      
      public var tellyCommand:int;
      
      public var tellyComP:Boolean;
      
      public var tellyComL:Boolean;
      
      public var tellyComK:Boolean;
      
      public var tellyComH:Boolean;
      
      public var tellyComD:Boolean;
      
      public var tellyComB:Boolean;
      
      public var tellyComA:Boolean;
      
      public var tellyCardiogram:int;
      
      public var tasTelly:int;
      
      public var noncommiTelly:Boolean;
      
      public var immorTelly:int;
      
      public var experimenTelly:int;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:String = undefined, param5:String = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined, param18:Object = undefined, param19:Object = undefined, param20:Object = undefined, param21:Object = undefined, param22:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         tellyOphile = {
            "1":false,
            "2":false,
            "3":false,
            "4":false,
            "5":false,
            "6":false,
            "7":false,
            "8":false,
            "9":false,
            "10":false,
            "11":false,
            "12":false,
            "13":false,
            "14":false,
            "15":false,
            "16":false,
            "17":false,
            "18":false,
            "19":false,
            "20":false,
            "21":false,
            "22":false,
            "23":false
         };
         tellyComD = false;
         tellyComH = false;
         tellyComA = false;
         tellyComP = false;
         tellyComK = false;
         tellyComB = false;
         tellyComL = false;
         immorTelly = 0;
         experimenTelly = 0;
         tasTelly = 0;
         vesTelly = 0;
         tellyPlasmed = false;
         tellyCommand = 0;
         tellyGram = 0;
         tellyTimer = 0;
         tellyCardiogram = 0;
         tellyGraph = "butterfly";
         tellyTubby = "purple";
         tellyCommute = false;
         noncommiTelly = false;
         tellyGenesis = false;
         if(param1 != null)
         {
            tellyGenesis = param1;
         }
         if(param2 != null)
         {
            noncommiTelly = param2;
         }
         if(param3 != null)
         {
            tellyCommute = param3;
         }
         if(param4 != null)
         {
            tellyTubby = param4;
         }
         if(param5 != null)
         {
            tellyGraph = param5;
         }
         if(param6 != null)
         {
            tellyCardiogram = param6;
         }
         if(param7 != null)
         {
            tellyTimer = param7;
         }
         if(param8 != null)
         {
            tellyGram = param8;
         }
         if(param9 != null)
         {
            tellyCommand = param9;
         }
         if(param10 != null)
         {
            tellyPlasmed = param10;
         }
         if(param11 != null)
         {
            vesTelly = param11;
         }
         if(param12 != null)
         {
            tasTelly = param12;
         }
         if(param13 != null)
         {
            experimenTelly = param13;
         }
         if(param14 != null)
         {
            immorTelly = param14;
         }
         if(param15 != null)
         {
            tellyComL = param15;
         }
         if(param16 != null)
         {
            tellyComB = param16;
         }
         if(param17 != null)
         {
            tellyComK = param17;
         }
         if(param18 != null)
         {
            tellyComP = param18;
         }
         if(param19 != null)
         {
            tellyComA = param19;
         }
         if(param20 != null)
         {
            tellyComH = param20;
         }
         if(param21 != null)
         {
            tellyComD = param21;
         }
         if(param22 != null)
         {
            tellyOphile = param22;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("tellyGenesis","在集市遇见了特莉",new BoolComponent(tellyGenesis,function(param1:Boolean):Boolean
         {
            return _gthis.tellyGenesis = param1;
         })),new DebugComp("noncommiTelly","探索时看到了特莉的马车",new BoolComponent(noncommiTelly,function(param1:Boolean):Boolean
         {
            return _gthis.noncommiTelly = param1;
         })),new DebugComp("tellyCommute","探索时遇见了特莉",new BoolComponent(tellyCommute,function(param1:Boolean):Boolean
         {
            return _gthis.tellyCommute = param1;
         })),new DebugComp("tellyTubby","面部彩绘颜色",new StringComponent(tellyTubby,function(param1:String):String
         {
            return _gthis.tellyTubby = param1;
         })),new DebugComp("tellyGraph","面部彩绘类型",new StringComponent(tellyGraph,function(param1:String):String
         {
            return _gthis.tellyGraph = param1;
         })),new DebugComp("tellyCardiogram","记录特莉在商店里做什么",new IntComponent(tellyCardiogram,function(param1:int):int
         {
            return _gthis.tellyCardiogram = param1;
         })),new DebugComp("tellyTimer","上次随机刷新的时间",new FloatComponent(tellyTimer,function(param1:Number):Number
         {
            return _gthis.tellyTimer = param1;
         })),new DebugComp("tellyGram","每次拜访聊天的次数",new IntComponent(tellyGram,function(param1:int):int
         {
            return _gthis.tellyGram = param1;
         })),new DebugComp("tellyCommand","记录特莉被禁用的天数",new IntComponent(tellyCommand,function(param1:int):int
         {
            return _gthis.tellyCommand = param1;
         })),new DebugComp("tellyPlasmed","记录你是否买过糖果",new BoolComponent(tellyPlasmed,function(param1:Boolean):Boolean
         {
            return _gthis.tellyPlasmed = param1;
         })),new DebugComp("vesTelly","记录你这小时是否拥抱过特莉",new IntComponent(vesTelly,function(param1:int):int
         {
            return _gthis.vesTelly = param1;
         })),new DebugComp("tasTelly","记录这个该死的桃子",new IntComponent(tasTelly,function(param1:int):int
         {
            return _gthis.tasTelly = param1;
         })),new DebugComp("experimenTelly","记录龙心花相关",new IntComponent(experimenTelly,function(param1:int):int
         {
            return _gthis.experimenTelly = param1;
         })),new DebugComp("immorTelly","记录情人节年份",new IntComponent(immorTelly,function(param1:int):int
         {
            return _gthis.immorTelly = param1;
         })),new DebugComp("tellyComL","询问过出售利德尔药水的事",new BoolComponent(tellyComL,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComL = param1;
         })),new DebugComp("tellyComB","给过熊",new BoolComponent(tellyComB,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComB = param1;
         })),new DebugComp("tellyComK","狐妖毛茸茸的尾巴",new BoolComponent(tellyComK,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComK = param1;
         })),new DebugComp("tellyComP","给过桃子",new BoolComponent(tellyComP,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComP = param1;
         })),new DebugComp("tellyComA","给过深渊碎片",new BoolComponent(tellyComA,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComA = param1;
         })),new DebugComp("tellyComH","解锁拥抱",new BoolComponent(tellyComH,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComH = param1;
         })),new DebugComp("tellyComD","给过龙心花",new BoolComponent(tellyComD,function(param1:Boolean):Boolean
         {
            return _gthis.tellyComD = param1;
         })),new DebugComp("tellyOphile[\"1\"]","记录你看过的聊天",new BoolComponent(Boolean(Reflect.field(tellyOphile,"1")),function(param1:Object):Object
         {
            _gthis.tellyOphile["1"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"2\"]","记录你看过的聊天",new BoolComponent(Boolean(Reflect.field(tellyOphile,"2")),function(param1:Object):Object
         {
            _gthis.tellyOphile["2"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"3\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"3")),function(param1:Object):Object
         {
            _gthis.tellyOphile["3"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"4\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"4")),function(param1:Object):Object
         {
            _gthis.tellyOphile["4"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"5\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"5")),function(param1:Object):Object
         {
            _gthis.tellyOphile["5"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"6\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"6")),function(param1:Object):Object
         {
            _gthis.tellyOphile["6"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"7\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"7")),function(param1:Object):Object
         {
            _gthis.tellyOphile["7"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"8\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"8")),function(param1:Object):Object
         {
            _gthis.tellyOphile["8"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"9\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"9")),function(param1:Object):Object
         {
            _gthis.tellyOphile["9"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"10\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"10")),function(param1:Object):Object
         {
            _gthis.tellyOphile["10"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"11\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"11")),function(param1:Object):Object
         {
            _gthis.tellyOphile["11"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"12\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"12")),function(param1:Object):Object
         {
            _gthis.tellyOphile["12"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"13\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"13")),function(param1:Object):Object
         {
            _gthis.tellyOphile["13"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"14\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"14")),function(param1:Object):Object
         {
            _gthis.tellyOphile["14"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"15\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"15")),function(param1:Object):Object
         {
            _gthis.tellyOphile["15"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"16\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"16")),function(param1:Object):Object
         {
            _gthis.tellyOphile["16"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"17\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"17")),function(param1:Object):Object
         {
            _gthis.tellyOphile["17"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"18\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"18")),function(param1:Object):Object
         {
            _gthis.tellyOphile["18"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"19\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"19")),function(param1:Object):Object
         {
            _gthis.tellyOphile["19"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"20\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"20")),function(param1:Object):Object
         {
            _gthis.tellyOphile["20"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"21\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"21")),function(param1:Object):Object
         {
            _gthis.tellyOphile["21"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"22\"]","记录你已看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"22")),function(param1:Object):Object
         {
            _gthis.tellyOphile["22"] = param1;
            return param1;
         })),new DebugComp("tellyOphile[\"23\"]","记录你已经看过的对话",new BoolComponent(Boolean(Reflect.field(tellyOphile,"23")),function(param1:Object):Object
         {
            _gthis.tellyOphile["23"] = param1;
            return param1;
         }))];
      }
   }
}

