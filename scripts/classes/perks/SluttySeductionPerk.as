package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class SluttySeductionPerk extends PerkType
   {
      
      public function SluttySeductionPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Slutty Seduction","Slutty Seduction","Your armor allows you access to \'Seduce\', an improved form of \'Tease\'.");
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "成功挑逗的几率和成功挑逗造成的欲望伤害增加" + param1.value1 + "点。";
      }
   }
}

