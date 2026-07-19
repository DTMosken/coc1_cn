package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class PentUpPerk extends PerkType
   {
      
      public function PentUpPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Pent Up","Pent Up","Increases minimum lust and makes you more vulnerable to seduction");
         boost("最低欲望",NumberFunc_Impl_.fromFloatFun(minLustBoost),false);
         boost("欲望抗性",NumberFunc_Impl_.fromFloatFun(lustResBoost),false);
      }
      
      public function minLustBoost() : Number
      {
         return getOwnValue(0);
      }
      
      public function lustResBoost() : Number
      {
         return -getOwnValue(0) / 2;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "最低欲望值增加" + Math.round(param1.value1) + "点，并且让你更容易被诱惑。";
      }
   }
}

