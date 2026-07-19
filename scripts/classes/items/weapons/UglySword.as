package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class UglySword extends Weapon
   {
      
      public function UglySword()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Medium");
         super("U.Sword","Ugly Sword","ugly sword","an ugly sword",["slash"],7,400,"This ugly sword is jagged and chipped, yet somehow perfectly balanced and unnaturally sharp. Its blade is black, and its material is of dubious origin.",["uglySword","1H Sword"]);
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = 7 + int((get_player().corAdjustedUp() - 70) / 3);
         if(_loc1_ < 5)
         {
            _loc1_ = 5;
         }
         return _loc1_;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().isCorruptEnough(70))
         {
            return true;
         }
         outputText("你抓住剑柄，却发现它变得滚烫。你不得不松开手，以免烧伤自己。剑里的某种东西一定很厌恶你。");
         return false;
      }
   }
}

