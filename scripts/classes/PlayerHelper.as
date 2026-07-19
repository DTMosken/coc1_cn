package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import flash.Boot;
   import haxe.IMap;
   
   public class PlayerHelper extends Character
   {
      
      public function PlayerHelper()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function lizardCocks() : int
      {
         return countCocksOfType(CockTypesEnum.LIZARD);
      }
      
      public function isBasilisk() : Boolean
      {
         if(get_game().bazaar.benoit.benoitBigFamily())
         {
            return eyes.type == 5;
         }
         return false;
      }
      
      public function hasUnderBody(param1:Boolean = false) : Boolean
      {
         var _loc2_:Array = [0];
         if(param1)
         {
            _loc2_.push(4);
            _loc2_.push(7);
         }
         return _loc2_.indexOf(underBody.type) == -1;
      }
      
      public function hasStinger() : Boolean
      {
         return [20,6].indexOf(tail.type) != -1;
      }
      
      public function hasReptileUnderBody(param1:Boolean = false) : Boolean
      {
         var _loc2_:Array = [1];
         if(param1)
         {
            _loc2_.push(4);
            _loc2_.push(7);
         }
         return _loc2_.indexOf(underBody.type) != -1;
      }
      
      public function hasReptileTail() : Boolean
      {
         return [9,14,25].indexOf(tail.type) != -1;
      }
      
      public function hasReptileLegs() : Boolean
      {
         return [10,18,25].indexOf(lowerBody.type) != -1;
      }
      
      public function hasReptileFace() : Boolean
      {
         return [5,7,12].indexOf(face.type) != -1;
      }
      
      public function hasReptileEyes() : Boolean
      {
         return [3,4,5].indexOf(eyes.type) != -1;
      }
      
      public function hasReptileArms() : Boolean
      {
         switch(arms.type)
         {
            case 5:
            case 13:
            case 14:
               return true;
            default:
               return false;
         }
      }
      
      public function hasPrehensileTail() : Boolean
      {
         return [3,8,9,14,16,25,28,4,29].indexOf(tail.type) != -1;
      }
      
      public function hasNormalNeck() : Boolean
      {
         return neck.len <= 2;
      }
      
      public function hasNonSharkRearBody() : Boolean
      {
         return [0,3].indexOf(rearBody.type) == -1;
      }
      
      public function hasNonCockatriceAntennae() : Boolean
      {
         return [0,3].indexOf(antennae.type) == -1;
      }
      
      public function hasMultiTails() : Boolean
      {
         if(tail.type == 13)
         {
            return tail.venom > 1;
         }
         return false;
      }
      
      public function hasLizardEyes() : Boolean
      {
         return [3,5].indexOf(eyes.type) != -1;
      }
      
      public function hasLeatheryWings(param1:Boolean = false) : Boolean
      {
         if(!hasDragonWings(param1))
         {
            return hasBatLikeWings(param1);
         }
         return true;
      }
      
      public function hasInsectAntennae() : Boolean
      {
         return antennae.type == 2;
      }
      
      public function hasGnollFur() : Boolean
      {
         if(skin.type == 1)
         {
            return lowerBody.type == 31;
         }
         return false;
      }
      
      public function hasFurryUnderBody(param1:Boolean = false) : Boolean
      {
         if(hasUnderBody(param1))
         {
            return underBody.skin.hasFur();
         }
         return false;
      }
      
      public function hasFurryTail() : Boolean
      {
         return [1,2,4,8,10,12,13,15,17,21,24,26,27,30,31].indexOf(tail.type) != -1;
      }
      
      public function hasFurryEars() : Boolean
      {
         return [1,3,2,5,7,8,9,11,12,13,16,17,19,22,23].indexOf(ears.type) != -1;
      }
      
      public function hasFeatheredUnderBody(param1:Boolean = false) : Boolean
      {
         if(hasUnderBody(param1))
         {
            return underBody.skin.hasFeathers();
         }
         return false;
      }
      
      public function hasFangs() : Boolean
      {
         return [28,6,5,10,24].indexOf(face.type) != -1;
      }
      
      public function hasDragonfire() : Boolean
      {
         return hasPerk(PerkLib.Dragonfire);
      }
      
      public function hasDragonWingsAndFire(param1:Boolean = true) : Boolean
      {
         if(hasDragonWings(param1))
         {
            return hasDragonfire();
         }
         return false;
      }
      
      public function hasDragonWings(param1:Boolean = false) : Boolean
      {
         if(param1)
         {
            return wings.type == 11;
         }
         return [10,11].indexOf(wings.type) != -1;
      }
      
      public function hasDragonRearBody() : Boolean
      {
         return [1,2].indexOf(rearBody.type) != -1;
      }
      
      public function hasDragonNeck() : Boolean
      {
         if(neck.type == 1)
         {
            return neck.isFullyGrown();
         }
         return false;
      }
      
      public function hasDragonHorns(param1:Boolean = false) : Boolean
      {
         if(!(!param1 && horns.value > 0 && horns.type == 3))
         {
            return horns.type == 4;
         }
         return true;
      }
      
      public function hasDraconicBackSide() : Boolean
      {
         if(hasDragonWings(true) && hasDragonScales() && hasReptileTail() && hasReptileArms())
         {
            return hasReptileLegs();
         }
         return false;
      }
      
      public function hasDifferentUnderBody() : Boolean
      {
         if([0,4,7].indexOf(underBody.type) != -1)
         {
            return false;
         }
         if(!(underBody.skin.type != skin.type || underBody.skin.tone != skin.tone || underBody.skin.adj != skin.adj || underBody.skin.desc != skin.desc))
         {
            if(underBody.skin.hasFur() && hasFur())
            {
               return underBody.skin.furColor != skin.furColor;
            }
            return false;
         }
         return true;
      }
      
      public function hasCockatriceSkin() : Boolean
      {
         if(skin.type == 2)
         {
            return underBody.type == 6;
         }
         return false;
      }
      
      public function hasBigWings() : Boolean
      {
         return [7,2,11,15,9,13].indexOf(wings.type) != -1;
      }
      
      public function hasBigEars() : Boolean
      {
         return [4,7,24].indexOf(ears.type) != -1;
      }
      
      public function hasBatLikeWings(param1:Boolean = false) : Boolean
      {
         if(param1)
         {
            return wings.type == 7;
         }
         return [6,7].indexOf(wings.type) != -1;
      }
      
      public function hasAntennae() : Boolean
      {
         return antennae.type != 0;
      }
      
      public function fetchEmberRearBody() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(get_flags(),528) == 2)
         {
            return 1;
         }
         return 2;
      }
      
      public function featheryHairPinEquipped() : Boolean
      {
         if(hasKeyItem("Feathery hair-pin"))
         {
            return keyItemv1("Feathery hair-pin") == 1;
         }
         return false;
      }
      
      public function dragonCocks() : int
      {
         return countCocksOfType(CockTypesEnum.DRAGON);
      }
   }
}

