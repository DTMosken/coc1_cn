package classes.scenes.npcs._Rathazul
{
   import coc.view.selfDebug.BoolComponent;
   import coc.view.selfDebug.Component;
   import coc.view.selfDebug.DebugComp;
   import coc.view.selfDebug.DebuggableSave;
   import coc.view.selfDebug.IntComponent;
   import flash.Boot;
   
   public class SaveContent implements DebuggableSave
   {
      
      public var offeredTrice:Boolean;
      
      public var offeredTBark:Boolean;
      
      public var offeredSilk:Boolean;
      
      public var offeredScale:Boolean;
      
      public var offeredReducto:Boolean;
      
      public var offeredPurify:Boolean;
      
      public var offeredPhilter:Boolean;
      
      public var offeredOculum:Boolean;
      
      public var offeredMinoCum:Boolean;
      
      public var offeredMarae:Boolean;
      
      public var offeredLactaidTaurinum:Boolean;
      
      public var offeredLaBova:Boolean;
      
      public var offeredHoney:Boolean;
      
      public var offeredGolemHeart:Boolean;
      
      public var offeredGel:Boolean;
      
      public var offeredEbonbloom:Boolean;
      
      public var offeredDye:Boolean;
      
      public var offeredDemonTF:Boolean;
      
      public var offeredDelight:Boolean;
      
      public var offeredDebimboSophie:Boolean;
      
      public var offeredDebimboPlayer:Boolean;
      
      public var offeredDBark:Boolean;
      
      public var offeredChitin:Boolean;
      
      public var mixologyXP:int;
      
      public var metRathazul:Boolean;
      
      public var giftedBear:Boolean;
      
      public var campOffer:Boolean;
      
      public var campFollower:Boolean;
      
      public function SaveContent(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined, param18:Object = undefined, param19:Object = undefined, param20:Object = undefined, param21:Object = undefined, param22:Object = undefined, param23:Object = undefined, param24:Object = undefined, param25:Object = undefined, param26:Object = undefined, param27:Object = undefined, param28:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         giftedBear = false;
         offeredDebimboSophie = false;
         offeredDebimboPlayer = false;
         offeredLactaidTaurinum = false;
         offeredLaBova = false;
         offeredMinoCum = false;
         offeredDelight = false;
         offeredDemonTF = false;
         offeredPurify = false;
         offeredOculum = false;
         offeredTrice = false;
         offeredDBark = false;
         offeredTBark = false;
         offeredGolemHeart = false;
         offeredMarae = false;
         offeredReducto = false;
         offeredHoney = false;
         offeredPhilter = false;
         offeredDye = false;
         offeredEbonbloom = false;
         offeredScale = false;
         offeredSilk = false;
         offeredChitin = false;
         offeredGel = false;
         mixologyXP = 0;
         campOffer = false;
         campFollower = false;
         metRathazul = false;
         if(param1 != null)
         {
            metRathazul = param1;
         }
         if(param2 != null)
         {
            campFollower = param2;
         }
         if(param3 != null)
         {
            campOffer = param3;
         }
         if(param4 != null)
         {
            mixologyXP = param4;
         }
         if(param5 != null)
         {
            offeredGel = param5;
         }
         if(param6 != null)
         {
            offeredChitin = param6;
         }
         if(param7 != null)
         {
            offeredSilk = param7;
         }
         if(param8 != null)
         {
            offeredScale = param8;
         }
         if(param9 != null)
         {
            offeredEbonbloom = param9;
         }
         if(param10 != null)
         {
            offeredDye = param10;
         }
         if(param11 != null)
         {
            offeredPhilter = param11;
         }
         if(param12 != null)
         {
            offeredHoney = param12;
         }
         if(param13 != null)
         {
            offeredReducto = param13;
         }
         if(param14 != null)
         {
            offeredMarae = param14;
         }
         if(param15 != null)
         {
            offeredGolemHeart = param15;
         }
         if(param16 != null)
         {
            offeredTBark = param16;
         }
         if(param17 != null)
         {
            offeredDBark = param17;
         }
         if(param18 != null)
         {
            offeredTrice = param18;
         }
         if(param19 != null)
         {
            offeredOculum = param19;
         }
         if(param20 != null)
         {
            offeredPurify = param20;
         }
         if(param21 != null)
         {
            offeredDemonTF = param21;
         }
         if(param22 != null)
         {
            offeredDelight = param22;
         }
         if(param23 != null)
         {
            offeredMinoCum = param23;
         }
         if(param24 != null)
         {
            offeredLaBova = param24;
         }
         if(param25 != null)
         {
            offeredLactaidTaurinum = param25;
         }
         if(param26 != null)
         {
            offeredDebimboPlayer = param26;
         }
         if(param27 != null)
         {
            offeredDebimboSophie = param27;
         }
         if(param28 != null)
         {
            giftedBear = param28;
         }
      }
      
      public function _debug() : Array
      {
         var _gthis:SaveContent = this;
         return [new DebugComp("metRathazul","",new BoolComponent(metRathazul,function(param1:Boolean):Boolean
         {
            return _gthis.metRathazul = param1;
         })),new DebugComp("campFollower","",new BoolComponent(campFollower,function(param1:Boolean):Boolean
         {
            return _gthis.campFollower = param1;
         })),new DebugComp("campOffer","",new BoolComponent(campOffer,function(param1:Boolean):Boolean
         {
            return _gthis.campOffer = param1;
         })),new DebugComp("mixologyXP","",new IntComponent(mixologyXP,function(param1:int):int
         {
            return _gthis.mixologyXP = param1;
         })),new DebugComp("offeredGel","",new BoolComponent(offeredGel,function(param1:Boolean):Boolean
         {
            return _gthis.offeredGel = param1;
         })),new DebugComp("offeredChitin","",new BoolComponent(offeredChitin,function(param1:Boolean):Boolean
         {
            return _gthis.offeredChitin = param1;
         })),new DebugComp("offeredSilk","",new BoolComponent(offeredSilk,function(param1:Boolean):Boolean
         {
            return _gthis.offeredSilk = param1;
         })),new DebugComp("offeredScale","",new BoolComponent(offeredScale,function(param1:Boolean):Boolean
         {
            return _gthis.offeredScale = param1;
         })),new DebugComp("offeredEbonbloom","",new BoolComponent(offeredEbonbloom,function(param1:Boolean):Boolean
         {
            return _gthis.offeredEbonbloom = param1;
         })),new DebugComp("offeredDye","",new BoolComponent(offeredDye,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDye = param1;
         })),new DebugComp("offeredPhilter","",new BoolComponent(offeredPhilter,function(param1:Boolean):Boolean
         {
            return _gthis.offeredPhilter = param1;
         })),new DebugComp("offeredHoney","",new BoolComponent(offeredHoney,function(param1:Boolean):Boolean
         {
            return _gthis.offeredHoney = param1;
         })),new DebugComp("offeredReducto","",new BoolComponent(offeredReducto,function(param1:Boolean):Boolean
         {
            return _gthis.offeredReducto = param1;
         })),new DebugComp("offeredMarae","",new BoolComponent(offeredMarae,function(param1:Boolean):Boolean
         {
            return _gthis.offeredMarae = param1;
         })),new DebugComp("offeredGolemHeart","",new BoolComponent(offeredGolemHeart,function(param1:Boolean):Boolean
         {
            return _gthis.offeredGolemHeart = param1;
         })),new DebugComp("offeredTBark","",new BoolComponent(offeredTBark,function(param1:Boolean):Boolean
         {
            return _gthis.offeredTBark = param1;
         })),new DebugComp("offeredDBark","",new BoolComponent(offeredDBark,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDBark = param1;
         })),new DebugComp("offeredTrice","",new BoolComponent(offeredTrice,function(param1:Boolean):Boolean
         {
            return _gthis.offeredTrice = param1;
         })),new DebugComp("offeredOculum","",new BoolComponent(offeredOculum,function(param1:Boolean):Boolean
         {
            return _gthis.offeredOculum = param1;
         })),new DebugComp("offeredPurify","",new BoolComponent(offeredPurify,function(param1:Boolean):Boolean
         {
            return _gthis.offeredPurify = param1;
         })),new DebugComp("offeredDemonTF","",new BoolComponent(offeredDemonTF,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDemonTF = param1;
         })),new DebugComp("offeredDelight","",new BoolComponent(offeredDelight,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDelight = param1;
         })),new DebugComp("offeredMinoCum","",new BoolComponent(offeredMinoCum,function(param1:Boolean):Boolean
         {
            return _gthis.offeredMinoCum = param1;
         })),new DebugComp("offeredLaBova","",new BoolComponent(offeredLaBova,function(param1:Boolean):Boolean
         {
            return _gthis.offeredLaBova = param1;
         })),new DebugComp("offeredLactaidTaurinum","",new BoolComponent(offeredLactaidTaurinum,function(param1:Boolean):Boolean
         {
            return _gthis.offeredLactaidTaurinum = param1;
         })),new DebugComp("offeredDebimboPlayer","",new BoolComponent(offeredDebimboPlayer,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDebimboPlayer = param1;
         })),new DebugComp("offeredDebimboSophie","",new BoolComponent(offeredDebimboSophie,function(param1:Boolean):Boolean
         {
            return _gthis.offeredDebimboSophie = param1;
         })),new DebugComp("giftedBear","",new BoolComponent(giftedBear,function(param1:Boolean):Boolean
         {
            return _gthis.giftedBear = param1;
         }))];
      }
   }
}

