package classes.items.weapons.unarmed
{
   import classes.PerkLib;
   import classes.StatusEffects;
   import classes.items.Equippable;
   import classes.items.Weapon;
   import classes.items.WeaponEffects;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class UnarmedClaws extends Weapon
   {
      
      public var clawTable:IMap;
      
      public function UnarmedClaws()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc1_:IMap = new IntMap();
         var _loc2_:* = {
            "attack":3,
            "name":"蜥蜴",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":0.9,
            "raceRegex":new EReg("(?:dracolisk|dragonewt|basilisk|lizan)","")
         };
         _loc1_.h[1] = _loc2_;
         _loc2_ = {
            "attack":10,
            "name":"龙",
            "bleedChance":30,
            "bleedDamage":0.3333333333333333,
            "penetration":0.8,
            "raceRegex":new EReg("dragon-","")
         };
         _loc1_.h[2] = _loc2_;
         _loc2_ = {
            "attack":5,
            "name":"火蜥蜴",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":0.9,
            "raceRegex":new EReg("salamander-","")
         };
         _loc1_.h[3] = _loc2_;
         _loc2_ = {
            "attack":4,
            "name":"猫",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":1,
            "raceRegex":new EReg("(?:kitten|cat|sphinx)-","")
         };
         _loc1_.h[4] = _loc2_;
         _loc2_ = {
            "attack":3,
            "name":"狗",
            "bleedChance":0,
            "bleedDamage":0.16666666666666666,
            "penetration":1,
            "raceRegex":new EReg("(?:dog|puppy)-","")
         };
         _loc1_.h[5] = _loc2_;
         _loc2_ = {
            "attack":4,
            "name":"狐狸",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":1,
            "raceRegex":new EReg("(?:fox-|kitsune)","")
         };
         _loc1_.h[6] = _loc2_;
         _loc2_ = {
            "attack":5,
            "name":"小恶魔",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":0.9,
            "raceRegex":new EReg("(?:imp|demon-)","")
         };
         _loc1_.h[8] = _loc2_;
         _loc2_ = {
            "attack":5,
            "name":"鸡蛇",
            "bleedChance":25,
            "bleedDamage":0.25,
            "penetration":0.9,
            "raceRegex":new EReg("cockatrice","")
         };
         _loc1_.h[9] = _loc2_;
         _loc2_ = {
            "attack":2,
            "name":"小熊猫",
            "bleedChance":0,
            "bleedDamage":0.16666666666666666,
            "penetration":1,
            "raceRegex":new EReg("red-panda","")
         };
         _loc1_.h[10] = _loc2_;
         _loc2_ = {
            "attack":2,
            "name":"雪貂",
            "bleedChance":0,
            "bleedDamage":0.16666666666666666,
            "penetration":1,
            "raceRegex":new EReg("ferret-","")
         };
         _loc1_.h[11] = _loc2_;
         _loc2_ = {
            "attack":5,
            "name":"狼",
            "bleedChance":10,
            "bleedDamage":0.2,
            "penetration":0.9,
            "raceRegex":new EReg("wolf-","")
         };
         _loc1_.h[12] = _loc2_;
         clawTable = _loc1_;
         super("Claws","Claws","claws","your [claws]",["swipe","claw"],1,0,"These are [claws]. They are probably sharp, unless they\'re dog claws because those usually aren\'t even a little bit sharp. Dog claws are usually used more as tools, for digging and traction and such, rather than as weapons. We\'ll still let you attack with them though. I think there are some breeds that do tend to have sharper claws, but dog claws still don\'t retract like cat claws so they dull very easily. Interestingly, foxes are canids but their claws are more like cat claws than dog claws, and they do retract. Foxes are more cat-like than dog-like in general, in my opinion. Wolf claws don\'t retract either, so they also tend to be somewhat dull, but they\'re more pointed than most dog claws so they\'re still better weapons, even if they aren\'t usually used as such. Anyways, this desc isn\'t supposed to be visible anywhere in-game but the claws needed a desc to prevent errors, so here we are.",["Claw","Unarmed"]);
         _plural = true;
         _singular = "claw";
      }
      
      override public function useText() : void
      {
      }
      
      public function raceMatch() : Boolean
      {
         return get_clawData().raceRegex.match(get_player().get_race());
      }
      
      override public function playerRemove() : Equippable
      {
         return null;
      }
      
      public function naturalWeapons() : Boolean
      {
         return get_player().hasPerk(PerkLib.NaturalWeapons);
      }
      
      override public function get_longName() : String
      {
         return "你的" + get_clawData().name + "爪";
      }
      
      override public function get_effects() : Array
      {
         var intensity:Number;
         var chance:int;
         var _g:WeaponEffects;
         var _loc1_:int = 0;
         var _loc2_:Number = 0;
         if(naturalWeapons())
         {
            _loc1_ = int(get_clawData().bleedChance);
            _loc2_ = Number(get_clawData().bleedDamage);
            if(raceMatch())
            {
               _loc1_ += 5 * masteryLevel();
               _loc2_ *= 1 + 0.2 * masteryLevel();
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.ClawStance) && _loc1_ < 60)
         {
            _loc1_ += int(Math.round((60 - _loc1_) * 0.7));
         }
         _g = Weapon.WEAPONEFFECTS;
         chance = _loc1_;
         intensity = _loc2_;
         return [function():void
         {
            _g.bleed(chance,intensity);
         }];
      }
      
      public function get_clawData() : Object
      {
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         if(get_player() != null)
         {
            _loc1_ = clawTable;
            _loc2_ = get_player().arms.claws.type;
            return _loc1_.h[_loc2_];
         }
         return clawTable.h[1];
      }
      
      override public function get_attack() : Number
      {
         var _loc1_:int = int(get_clawData().attack);
         var _loc2_:Number = 1;
         if(raceMatch())
         {
            _loc2_ += 0.5;
         }
         if(naturalWeapons())
         {
            _loc2_ += 0.5;
         }
         return int(Math.round(_loc1_ * _loc2_));
      }
      
      override public function get_armorMod() : Number
      {
         var _loc1_:Number = 1;
         if(naturalWeapons())
         {
            _loc1_ = Number(get_clawData().penetration);
         }
         return _loc1_;
      }
   }
}

