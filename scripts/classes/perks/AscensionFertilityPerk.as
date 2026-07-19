package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionFertilityPerk extends PerkType
   {
      
      public function AscensionFertilityPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Fertility","Ascension: Fertility","","Increases fertility rating by 5 per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 15 + ") 增加基础生育率 " + param1.value1 * 5 + "。";
      }
   }
}

