package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class ControlledBreathPerk extends PerkType
   {
      
      public function ControlledBreathPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Controlled Breath","Controlled Breath","Jojo\'s training allows you to recover more quickly. Increases rate of fatigue regeneration by 10%");
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(!get_player().isPureEnough(30))
         {
            return "<b>已禁用</b> - 腐化过高！";
         }
         return super.desc(param1);
      }
   }
}

