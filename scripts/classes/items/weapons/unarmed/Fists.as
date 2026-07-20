package classes.items.weapons.unarmed
{
   import classes.items.Equippable;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class Fists extends Weapon
   {
      
      public function Fists()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         set_weightCategory("Light");
         super("Fists  ","Fists","fists","your fists",["punch"],0,0,null,["Fist","徒手"]);
         _plural = true;
         _singular = "拳头";
      }
      
      override public function useText() : void
      {
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
   }
}

