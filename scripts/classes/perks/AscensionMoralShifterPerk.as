package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AscensionMoralShifterPerk extends PerkType
   {
      
      public function AscensionMoralShifterPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Moral Shifter","Ascension: Moral Shifter","","All corruption gains and losses are increased by 20% per level.");
         boost("腐化增加",NumberFunc_Impl_.fromFloatFun(corMod),true);
         boost("腐化降低",NumberFunc_Impl_.fromFloatFun(corMod),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 腐化的增加和减少量提高" + param1.value1 * 20 + "%。";
      }
      
      public function corMod() : Number
      {
         return 1 + getOwnValue(0) * 0.2;
      }
   }
}

