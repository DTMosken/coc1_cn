package classes.items.armors
{
   import classes.CoC;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Armor;
   import flash.Boot;
   
   public class BalletDress extends Armor
   {
      
      public function BalletDress()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("BalletD","Ballet Dress","frilly ballet dress","a frilly ballet dress",0,2400,"A replica of a dress worn by a female follower of a forgotten deity, resembling a ballet dress. Ornamented with plenty of bows and ruffles, it is sure to stand out in a crowd. It provides no physical protection, but is quite easy to move in, and despite a lack of enchantments, there is something mystical about it.","Light");
         boost("闪避几率",NumberFunc_Impl_.fromInt(1),false);
         boost("法术消耗",NumberFunc_Impl_.fromInt(-20),false);
      }
      
      override public function get_shortName() : String
      {
         if(get_game() != null && get_game().get_silly())
         {
            return "Magic Dress";
         }
         return "Ballet Dress";
      }
      
      override public function get_name() : String
      {
         if(get_game() != null && get_game().get_silly())
         {
            return "magical girl dress";
         }
         return "frilly ballet dress";
      }
      
      override public function get_longName() : String
      {
         if(get_game() != null && get_game().get_silly())
         {
            return "a magical girl dress";
         }
         return "a frilly ballet dress";
      }
   }
}

