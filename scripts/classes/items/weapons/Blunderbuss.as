package classes.items.weapons
{
   import classes.PerkLib;
   import flash.Boot;
   
   public class Blunderbuss extends WeaponWithPerk
   {
      
      public function Blunderbuss()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Blunder","Blunderbuss","blunderbuss","a blunderbuss",["blast","shoot"],22,600,"A firearm designed by an expert, unknown craftsman. Its flared muzzle allows for a wide spread of projectiles that is difficult to dodge.",["Firearm"],PerkLib.Scattering,0.25,0,0,0);
         set_ammoMax(1);
      }
   }
}

