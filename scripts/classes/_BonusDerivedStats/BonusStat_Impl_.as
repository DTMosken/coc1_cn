package classes._BonusDerivedStats
{
   public final class BonusStat_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var dodge:String;
      
      public static var spellMod:String;
      
      public static var critC:String;
      
      public static var critCWeapon:String;
      
      public static var critD:String;
      
      public static var maxHealth:String;
      
      public static var spellCost:String;
      
      public static var accuracy:String;
      
      public static var physDmg:String;
      
      public static var healthRegenPercent:String;
      
      public static var healthRegenFlat:String;
      
      public static var minLust:String;
      
      public static var lustRes:String;
      
      public static var movementChance:String;
      
      public static var teaseChance:String;
      
      public static var teaseDamage:String;
      
      public static var attackDamage:String;
      
      public static var globalMod:String;
      
      public static var weaponDamage:String;
      
      public static var fatigueMax:String;
      
      public static var damageTaken:String;
      
      public static var armor:String;
      
      public static var armorPen:String;
      
      public static var parry:String;
      
      public static var bodyDmg:String;
      
      public static var xpGain:String;
      
      public static var statGain:String;
      
      public static var strGain:String;
      
      public static var touGain:String;
      
      public static var speGain:String;
      
      public static var intGain:String;
      
      public static var libGain:String;
      
      public static var senGain:String;
      
      public static var corGain:String;
      
      public static var statLoss:String;
      
      public static var strLoss:String;
      
      public static var touLoss:String;
      
      public static var speLoss:String;
      
      public static var intLoss:String;
      
      public static var libLoss:String;
      
      public static var senLoss:String;
      
      public static var corLoss:String;
      
      public static var minLib:String;
      
      public static var minSen:String;
      
      public function BonusStat_Impl_()
      {
      }
      
      public static function multiplicative(param1:String) : String
      {
         if(param1.indexOf("Multiplicative") <= -1)
         {
            return param1 + "Multiplicative";
         }
         return param1;
      }
      
      public static function additive(param1:String) : String
      {
         return new EReg("Multiplicative","").replace(param1,"");
      }
      
      public static function _new(param1:String) : String
      {
         return param1;
      }
   }
}

