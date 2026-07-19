package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class SpellcastingAffinityPerk extends PerkType
   {
      
      public function SpellcastingAffinityPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Spellcasting Affinity","Spellcasting Affinity","Reduces spell costs.");
         boost("法术消耗",NumberFunc_Impl_.fromFloatFun(costReduction),false);
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "法术消耗减少" + param1.value1 + "%。";
      }
      
      public function costReduction() : Number
      {
         return -getOwnValue(0);
      }
   }
}

