package classes.items.weapons
{
   import classes.items.Weapon;
   import flash.Boot;
   
   public class LargeHammer extends Weapon
   {
      
      public function LargeHammer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("L.Hammr","Marble\'sHammer","large hammer","Marble\'s large hammer",["blow","smash"],16,90,"A warhammer that you took from Marble after she refused your advances. It looks like it could be pretty devastating in the right hands, though you\'ll need two of them to wield it due to its size.",["2H Blunt"]);
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_tallness() >= 60)
         {
            return true;
         }
         outputText("这把锤子对你来说太大了，无法有效挥舞。");
         return false;
      }
   }
}

