package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionVirilityPerk extends PerkType
   {
      
      public function AscensionVirilityPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Virility","Ascension: Virility","","Increases base virility rating by 5 per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 15 + ") 基础雄风评级增加" + param1.value1 * 5 + "。";
      }
   }
}

