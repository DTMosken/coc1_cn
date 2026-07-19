package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class MidnightRapier extends Weapon
   {
      
      public function MidnightRapier()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("MRapier","MidnightRapier","midnight rapier","a midnight rapier",["slash"],15,1250,"This rapier is forged from a metal that is as dark as a starless night. Its blade shows some signs of use, but its power is no less tremendous.",["uglySword","1H Sword"],0.7);
      }
      
      override public function get_attack() : Number
      {
         return 15 + get_player().rapierTrainingBoost();
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().isCorruptEnough(90))
         {
            return true;
         }
         outputText("你抓住刺剑的剑柄，却发现它变得滚烫。你不得不松开手，以免烧伤自己。刺剑里的某种东西一定很厌恶你。");
         return false;
      }
   }
}

