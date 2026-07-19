package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class CleansingPalmPerk extends PerkType
   {
      
      public function CleansingPalmPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Cleansing Palm","Cleansing Palm","A ranged fighting technique of Jojo\'s order, allows you to blast your enemies with waves of pure spiritual energy, weakening them and hurting the corrupt.");
      }
      
      override public function desc(param1:Perk = undefined) : String
      {
         if(!get_player().isPureEnough(10))
         {
            return "<b>已禁用</b> - 腐化过高！";
         }
         return super.desc(param1);
      }
   }
}

