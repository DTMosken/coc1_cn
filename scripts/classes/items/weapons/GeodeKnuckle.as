package classes.items.weapons
{
   import classes.MasteryLib;
   import classes.StatusEffects;
   import classes.items.Equippable;
   import classes.items.Weapon;
   import classes.items.WeaponEffects;
   import flash.Boot;
   
   public class GeodeKnuckle extends Weapon
   {
      
      public function GeodeKnuckle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Geode Knuckle","Geode Knuckle","geode knuckles","a crystalline fist",["punch"],15,0,"Your fists are coated in a thick, but somehow flexible layer of stone and crystal, with jagged shards of colorful gemstones jutting out of the knuckles.",["Fist","Attached","Summoned"]);
      }
      
      override public function useText() : void
      {
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
      
      override public function get_effects() : Array
      {
         var cost:int;
         var _g1:WeaponEffects;
         var chanceBleed:int;
         var chanceStun:int;
         var _g:WeaponEffects;
         var _loc1_:int = 5 * (get_player().masteryLevel(MasteryLib.TerrestrialFire) - 3);
         var _loc2_:int = 15 - 5 * (get_player().masteryLevel(MasteryLib.TerrestrialFire) - 3);
         if(get_player().hasStatusEffect(StatusEffects.TFGeodeKnuckle))
         {
            _loc2_ = 0;
         }
         _g = Weapon.WEAPONEFFECTS;
         chanceStun = _loc1_;
         chanceBleed = _loc1_;
         _g1 = Weapon.WEAPONEFFECTS;
         cost = _loc2_;
         return [function():void
         {
            _g.stunAndBleed(chanceStun,chanceBleed);
         },function():void
         {
            _g1.summonedDrain(cost);
         }];
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = 5 * get_player().masteryLevel(MasteryLib.TerrestrialFire);
         return int(_loc1_ + int(get_player().get_str() * 0.3));
      }
      
      override public function get_armorMod() : Number
      {
         return 1 - 0.05 * (get_player().masteryLevel(MasteryLib.TerrestrialFire) - 3);
      }
      
      override public function get_accBonus() : Number
      {
         if(get_player().masteryLevel(MasteryLib.TerrestrialFire) >= 5)
         {
            return 5;
         }
         return 0;
      }
   }
}

