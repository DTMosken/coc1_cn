package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionWisdomPerk extends PerkType
   {
      
      public function AscensionWisdomPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Wisdom","Ascension: Wisdom","","Increases experience gains by 10% per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 5 + ") 战斗中获得的经验值增加" + param1.value1 * 10 + "%。";
      }
   }
}

