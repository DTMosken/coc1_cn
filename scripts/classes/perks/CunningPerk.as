package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class CunningPerk extends PerkType
   {
      
      public function CunningPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Cunning","Cunning","Increases critical chance, but reduces critical damage.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "暴击率提高<b>" + param1.value1 + "%</b>，但暴击伤害降低<b>" + param1.value2 * 100 + "%</b>";
      }
   }
}

