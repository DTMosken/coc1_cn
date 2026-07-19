package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class AscensionDesiresPerk extends PerkType
   {
      
      public function AscensionDesiresPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ascension: Desires","Ascension: Desires","","Increases maximum lust by 5 per level.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "(等级：" + param1.value1 + "/" + 10 + ") 增加最大欲望 " + param1.value1 * 5 + "。";
      }
   }
}

