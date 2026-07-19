package classes.items.armors
{
   import classes.Player;
   import classes.items.Armor;
   import flash.Boot;
   
   public class ComfortableClothes extends Armor
   {
      
      public function ComfortableClothes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("C.Cloth","Comfy Clothes","comfortable clothes","a set of comfortable clothes",0,0,"These loose fitting and comfortable clothes allow you to move freely while protecting you from the elements.","Light",true);
      }
      
      override public function get_supportsBulge() : Boolean
      {
         return get_player().get_modArmorName() != "crotch-hugging clothes";
      }
   }
}

