package classes.perks
{
   import classes.MasteryLib;
   import classes.Perk;
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class SpellswordPerk extends PerkType
   {
      
      public function SpellswordPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Spellsword","Spellsword","Start every battle with Charge Weapon enabled, if you meet White Magic requirements before it starts.","You choose the \'Spellsword\' perk. You start every battle with the Charge Weapon effect, as long as you meet the requirements to cast it before battle.");
      }
      
      override public function get_longDesc() : String
      {
         if(host is Player && get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
         {
            return "你选择了“魔剑士”特质。只要你在战前满足施法条件，你就会在每场战斗开始时带有充能武器或引燃效果。";
         }
         return super.get_longDesc();
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(host is Player && get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 2)
         {
            return "如果你满足施法要求，每场战斗开始时都会激活充能武器或引燃。";
         }
         return super.desc();
      }
   }
}

