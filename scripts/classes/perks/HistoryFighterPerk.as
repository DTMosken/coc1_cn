package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class HistoryFighterPerk extends PerkType
   {
      
      public function HistoryFighterPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("History: Fighter","History: Fighter","A past full of conflict increases physical damage dealt by 10%.");
         boost("物理伤害",NumberFunc_Impl_.fromFloat(1.1),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return true;
      }
      
      override public function get_name() : String
      {
         if(host is Player && host.wasElder())
         {
            return "History: Guard";
         }
         return super.get_name();
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(host is Player && host.wasElder())
         {
            return "充满冲突的过去使造成的物理伤害增加10%，并让你在年老时仍能保持身体能力。";
         }
         return super.desc();
      }
   }
}

