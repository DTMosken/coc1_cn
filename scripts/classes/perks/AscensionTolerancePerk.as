package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionTolerancePerk extends PerkType
   {
      
      public function AscensionTolerancePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Corruption Tolerance","Ascension: Corruption Tolerance","","Increases corruption tolerance by 5 per level and reduces corruption requirement by 5 per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 20 + ") 腐化耐性增加" + param1.value1 * 5 + "，腐化需求降低" + param1.value1 * 5 + "。";
      }
   }
}

