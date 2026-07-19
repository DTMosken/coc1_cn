package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionFortunePerk extends PerkType
   {
      
      public function AscensionFortunePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Fortune","Ascension: Fortune","","Increases gems gains by 10% per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + ") 增加战斗中获得的宝石 " + param1.value1 * 10 + "%。";
      }
   }
}

