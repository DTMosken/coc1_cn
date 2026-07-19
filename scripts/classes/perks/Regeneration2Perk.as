package classes.perks
{
   import classes.CoC;
   import classes.Perk;
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class Regeneration2Perk extends PerkType
   {
      
      public function Regeneration2Perk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Regeneration 2","Regeneration 2","Regenerates an additional 2% of max HP/hour and 1% of max HP/round.","You choose the \'Regeneration 2\' perk, giving you an additional 1% of max HP per turn in combat and 2% of max HP per hour.");
         boost("生命恢复 (%)",NumberFunc_Impl_.fromInt(1),false);
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(get_game().get_survival() && get_game().player.hunger < 25)
         {
            return "<b>已禁用</b> - 你太饿了！";
         }
         return super.desc(param1);
      }
   }
}

