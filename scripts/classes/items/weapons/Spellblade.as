package classes.items.weapons
{
   import classes.PerkLib;
   import flash.Boot;
   
   public class Spellblade extends WeaponWithPerk
   {
      
      public function Spellblade()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("S.Blade","Spellblade","inscribed spellblade","a spellblade",["slash"],8,500,"Forged not by a swordsmith, but by a sorceress, this arcane-infused blade amplifies any effects applied to it. Unlike the wizard staves it is based on, this weapon also has a sharp edge, a technological innovation which has proven historically useful in battle.",["1H Sword"],PerkLib.ArcaneSmithing,1.5,0,0,0);
      }
   }
}

