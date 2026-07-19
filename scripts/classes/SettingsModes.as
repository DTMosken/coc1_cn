package classes
{
   import flash.Boot;
   
   public class SettingsModes
   {
      
      public var temptation:Boolean;
      
      public var taint:Boolean;
      
      public var survival:Boolean;
      
      public var silly:Boolean;
      
      public var scaling:Boolean;
      
      public var realistic:Boolean;
      
      public var prison:Boolean;
      
      public var oldAscension:Boolean;
      
      public var longHaul:Boolean;
      
      public var hyper:Boolean;
      
      public var hardcoreSlot:String;
      
      public var hardcore:Boolean;
      
      public var difficulty:int;
      
      public var cooldowns:Boolean;
      
      public function SettingsModes(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:String = undefined, param6:Object = undefined, param7:Object = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         prison = false;
         oldAscension = false;
         longHaul = false;
         scaling = false;
         cooldowns = false;
         taint = false;
         temptation = false;
         hyper = false;
         silly = false;
         hardcoreSlot = null;
         hardcore = false;
         realistic = false;
         survival = false;
         difficulty = 0;
         if(param1 != null)
         {
            difficulty = param1;
         }
         if(param2 != null)
         {
            survival = param2;
         }
         if(param3 != null)
         {
            realistic = param3;
         }
         if(param4 != null)
         {
            hardcore = param4;
         }
         if(param5 != null)
         {
            hardcoreSlot = param5;
         }
         if(param6 != null)
         {
            silly = param6;
         }
         if(param7 != null)
         {
            hyper = param7;
         }
         if(param8 != null)
         {
            temptation = param8;
         }
         if(param9 != null)
         {
            taint = param9;
         }
         if(param10 != null)
         {
            cooldowns = param10;
         }
         if(param11 != null)
         {
            scaling = param11;
         }
         if(param12 != null)
         {
            longHaul = param12;
         }
         if(param13 != null)
         {
            oldAscension = param13;
         }
         if(param14 != null)
         {
            prison = param14;
         }
      }
   }
}

