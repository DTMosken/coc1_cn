package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class WizardsEndurancePerk extends PerkType
   {
      
      public function WizardsEndurancePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Wizard\'s Endurance","Wizard\'s Endurance","Your spellcasting equipment makes it harder for spell-casting to fatigue you!");
         boost("法术消耗",NumberFunc_Impl_.fromFloatFun(costReduction),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "法术疲劳消耗减少" + param1.value1 + "%。";
      }
      
      public function costReduction() : Number
      {
         return -getOwnValue(0);
      }
   }
}

