package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class KillerInstinctPerk extends PerkType
   {
      
      public function KillerInstinctPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Killer Instinct","Killer Instinct","Allows bow attacks to crit.");
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         return "额外的弓箭经验使部分射击能造成巨大的暴击伤害。对被击晕的目标射击会自动造成轻微的暴击伤害。";
      }
   }
}

