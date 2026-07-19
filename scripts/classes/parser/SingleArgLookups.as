package classes.parser
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import haxe.IMap;
   
   public class SingleArgLookups
   {
      
      public static var init__:Boolean;
      
      public static var CONVERTERS:IMap;
      
      public function SingleArgLookups()
      {
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
   }
}

