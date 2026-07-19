package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AscensionEndurancePerk extends PerkType
   {
      
      public function AscensionEndurancePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Endurance","Ascension: Endurance","","Increases maximum fatigue by 5 per level.");
         boost("最大疲劳度",NumberFunc_Impl_.fromIntFun(fatigueBonus),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      public function fatigueBonus() : int
      {
         return 5 * int(Math.round(getOwnValue(0)));
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 增加最大疲劳 " + param1.value1 * 5 + "。";
      }
   }
}

