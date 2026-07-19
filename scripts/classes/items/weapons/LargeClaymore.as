package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class LargeClaymore extends Weapon
   {
      
      public function LargeClaymore()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Claymor","LargeClaymore","large claymore","a large claymore",["slash","cleave"],15,1000,"A massive sword that a strong warrior might use. Requires 40 strength to use.",["2H Sword"]);
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_str() >= 40)
         {
            return true;
         }
         outputText("你还不够强壮，无法使用这么重的武器！");
         return false;
      }
   }
}

