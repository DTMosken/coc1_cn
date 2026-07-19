package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class ScarredBlade extends Weapon
   {
      
      public function ScarredBlade()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Medium");
         super("ScarBld","Scarred Blade","scarred blade","a scarred blade",["slash"],10,1000,"This saber, made from lethicite-imbued metal, eagerly seeks flesh; it resonates with disdain and delivers deep, jagged wounds as it tries to bury itself in the bodies of others. It only cooperates with the corrupt.",["1H Sword"]);
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = 10 + int((get_player().corAdjustedUp() - 70) / 3);
         if(_loc1_ < 10)
         {
            _loc1_ = 10;
         }
         return _loc1_;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().isCorruptEnough(70))
         {
            return true;
         }
         get_game().sheilaScene.rebellingScarredBlade(true);
         return false;
      }
   }
}

