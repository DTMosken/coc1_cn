package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import flash.Boot;
   
   public class ElvenBountyPerk extends PerkType
   {
      
      public function ElvenBountyPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Elven Bounty","Elven Bounty","After your encounter with an elf, her magic has left you with increased fertility and virility.",null,true);
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         var _loc2_:Array = [];
         if(!Boolean(Math.isNaN(param1.value1)))
         {
            _loc2_.push("精液产量增加" + param1.value1 + " 毫升");
         }
         if(!Boolean(Math.isNaN(param1.value2)))
         {
            _loc2_.push("生育能力增加" + param1.value2 + "%");
         }
         return "" + _loc2_.join("、") + "。";
      }
   }
}

