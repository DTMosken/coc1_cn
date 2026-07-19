package classes.perks
{
   import classes.Perk;
   import classes.PerkType;
   import classes.Player;
   import flash.Boot;
   
   public class EnlightenedPerk extends PerkType
   {
      
      public function EnlightenedPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Enlightened","Enlightened","Jojo\'s tutelage has given you a master\'s focus and you can feel the universe in all its glory spread out before you. You\'ve finally surpassed your teacher.");
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

