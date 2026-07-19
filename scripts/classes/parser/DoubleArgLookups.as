package classes.parser
{
   import classes.Player;
   import classes.globalFlags.KGAMECLASS;
   import classes.scenes.npcs.ArianScene;
   import classes.scenes.npcs.EmberScene;
   import classes.scenes.places.bazaar.Benoit;
   import classes.scenes.places.telAdre.Rubi;
   import classes.scenes.seasonal.Nieve;
   import haxe.IMap;
   
   public class DoubleArgLookups
   {
      
      public static var init__:Boolean;
      
      public static var cockLookups:IMap;
      
      public static var cockHeadLookups:IMap;
      
      public static var shortCockLookups:IMap;
      
      public static var cockTypeLookups:IMap;
      
      public static var twoWordNumericTagsLookup:IMap;
      
      public static var arianLookups:IMap;
      
      public static var emberLookups:IMap;
      
      public static var rubiLookups:IMap;
      
      public static var benoitLookups:IMap;
      
      public static var nieveLookups:IMap;
      
      public static var twoWordTagsLookup:IMap;
      
      public function DoubleArgLookups()
      {
      }
      
      public static function get_player() : Player
      {
         return KGAMECLASS.kGAMECLASS.player;
      }
      
      public static function hasCock(param1:Function, param2:Number) : String
      {
         if(!DoubleArgLookups.get_player().hasCock())
         {
            return "<b>(尝试在没有肉棒时解析肉棒。)</b>";
         }
         return param1(param2);
      }
      
      public static function inRange(param1:Function, param2:Number) : String
      {
         if(param2 <= 0 || param2 > DoubleArgLookups.get_player().cockTotal())
         {
            return "<b>(Attempt To Parse an Invalid Cock " + param2 + ")</b>";
         }
         return param1(int(param2 - 1));
      }
      
      public static function fits(param1:Number, param2:Function) : String
      {
         var _loc3_:int = DoubleArgLookups.get_player().cockThatFits(param1);
         if(_loc3_ >= 0)
         {
            return param2(_loc3_);
         }
         return param2(DoubleArgLookups.get_player().smallestCockIndex());
      }
      
      public static function fits2(param1:Number, param2:Function) : String
      {
         var _loc3_:int = DoubleArgLookups.get_player().cockThatFits2(param1);
         if(_loc3_ >= 0)
         {
            return param2(_loc3_);
         }
         return param2(DoubleArgLookups.get_player().smallestCockIndex());
      }
      
      public static function get_arian() : ArianScene
      {
         return KGAMECLASS.kGAMECLASS.arianScene;
      }
      
      public static function get_ember() : EmberScene
      {
         return KGAMECLASS.kGAMECLASS.emberScene;
      }
      
      public static function get_rubi() : Rubi
      {
         return KGAMECLASS.kGAMECLASS.telAdre.rubi;
      }
      
      public static function get_benoit() : Benoit
      {
         return KGAMECLASS.kGAMECLASS.bazaar.benoit;
      }
      
      public static function get_nieve() : Nieve
      {
         return KGAMECLASS.kGAMECLASS.xmas.nieve;
      }
   }
}

