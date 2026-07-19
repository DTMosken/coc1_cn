package classes.scenes.combat
{
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.internals._ValueFunc.ValueFunc_Impl_;
   import flash.Boot;
   
   public class AbilityDef
   {
      
      public var tooltip:Function;
      
      public var spellShort:Function;
      
      public var spellName:String;
      
      public var range:Function;
      
      public var oneUse:Boolean;
      
      public var isWeaponAbility:Boolean;
      
      public var isSelf:Boolean;
      
      public var isHeal:Boolean;
      
      public var isFree:Boolean;
      
      public var isBow:Boolean;
      
      public var disabledWhen:Function;
      
      public var disabledTooltip:Function;
      
      public var cost:Function;
      
      public var cooldown:int;
      
      public var clearScreen:Boolean;
      
      public var availableWhen:Function;
      
      public var abilityType:Function;
      
      public var abilityFunc:Function;
      
      public var ID:String;
      
      public function AbilityDef(param1:Function = undefined, param2:Function = undefined, param3:Function = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:String = undefined, param8:Object = undefined, param9:Object = undefined, param10:Object = undefined, param11:Object = undefined, param12:Object = undefined, param13:Object = undefined, param14:Object = undefined, param15:Object = undefined, param16:Object = undefined, param17:Object = undefined, param18:Object = undefined, param19:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ID = null;
         isWeaponAbility = false;
         range = ValueFunc_Impl_.fromT(CombatRange.Omni);
         cooldown = 0;
         clearScreen = true;
         oneUse = false;
         isBow = false;
         isSelf = false;
         isFree = false;
         isHeal = false;
         abilityType = ValueFunc_Impl_.fromT(0);
         spellShort = ValueFunc_Impl_.fromT("");
         spellName = "";
         cost = NumberFunc_Impl_.fromFloat(0);
         disabledTooltip = ValueFunc_Impl_.fromT("");
         disabledWhen = ValueFunc_Impl_.fromT(false);
         abilityFunc = param1;
         tooltip = param2;
         availableWhen = param3;
         if(param4 != null)
         {
            disabledWhen = param4;
         }
         if(param5 != null)
         {
            disabledTooltip = param5;
         }
         if(param6 != null)
         {
            cost = param6;
         }
         if(param7 != null)
         {
            spellName = param7;
         }
         if(param8 != null)
         {
            spellShort = param8;
         }
         if(param9 != null)
         {
            abilityType = param9;
         }
         if(param10 != null)
         {
            isHeal = param10;
         }
         if(param11 != null)
         {
            isFree = param11;
         }
         if(param12 != null)
         {
            isSelf = param12;
         }
         if(param13 != null)
         {
            isBow = param13;
         }
         if(param14 != null)
         {
            oneUse = param14;
         }
         if(param15 != null)
         {
            clearScreen = param15;
         }
         if(param16 != null)
         {
            cooldown = param16;
         }
         if(param17 != null)
         {
            range = param17;
         }
         if(param18 != null)
         {
            isWeaponAbility = param18;
         }
         if(param19 != null)
         {
            ID = param19;
         }
      }
   }
}

