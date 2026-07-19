package classes.parser
{
   import classes.Player;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import haxe.IMap;
   
   public class ConditionalConverters
   {
      
      public static var init__:Boolean;
      
      public static var CONVERTERS:IMap;
      
      public function ConditionalConverters()
      {
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
      
      public static function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
   }
}

