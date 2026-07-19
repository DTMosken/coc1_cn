package classes
{
   import classes.masteries.BowMastery;
   import classes.masteries.CastingMastery;
   import classes.masteries.ClawMastery;
   import classes.masteries.FistMastery;
   import classes.masteries.ShieldMastery;
   import classes.masteries.TerrestrialFireMastery;
   import classes.masteries.WeaponMastery;
   import flash.Boot;
   
   public class MasteryLib extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var Tease:MasteryType;
      
      public static var Shield:ShieldMastery;
      
      public static var Casting:CastingMastery;
      
      public static var TerrestrialFire:TerrestrialFireMastery;
      
      public static var Fist:FistMastery;
      
      public static var Claw:ClawMastery;
      
      public static var Bow:BowMastery;
      
      public static var Sword1H:WeaponMastery;
      
      public static var Sword2H:WeaponMastery;
      
      public static var Knife:WeaponMastery;
      
      public static var Blunt1H:WeaponMastery;
      
      public static var Blunt2H:WeaponMastery;
      
      public static var Spear:WeaponMastery;
      
      public static var Axe:WeaponMastery;
      
      public static var Staff:WeaponMastery;
      
      public static var Polearm:WeaponMastery;
      
      public static var Scythe:WeaponMastery;
      
      public static var Whip:WeaponMastery;
      
      public static var Crossbow:WeaponMastery;
      
      public static var Firearm:WeaponMastery;
      
      public static var Gathering:MasteryType;
      
      public static var BasicCrafting:MasteryType;
      
      public static var Alchemy:MasteryType;
      
      public static var Cooking:MasteryType;
      
      public static var Weaponcrafting:MasteryType;
      
      public static var Armorcrafting:MasteryType;
      
      public static var Enchantment:MasteryType;
      
      public static var Constructs:MasteryType;
      
      public static var MASTERY_GENERAL:Array;
      
      public static var MASTERY_WEAPONS:Array;
      
      public static var MASTERY_CRAFTING:Array;
      
      public function MasteryLib()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
   }
}

