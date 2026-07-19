package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionSeductionPerk extends PerkType
   {
      
      public function AscensionSeductionPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Seduction","Ascension: Seduction","","Increases tease damage by 5% per level, multiplicatively.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 以乘算方式提升 " + param1.value1 * 5 + "% 挑逗伤害。";
      }
   }
}

