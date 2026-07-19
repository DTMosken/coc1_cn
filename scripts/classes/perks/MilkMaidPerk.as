package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class MilkMaidPerk extends PerkType
   {
      
      public function MilkMaidPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Milk Maid","Milk Maid","Increases milk production by ---mL. Allows you to lactate perpetually.");
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/10) 增加产奶量 " + (200 + param1.value1 * 100) + " 毫升。";
      }
   }
}

