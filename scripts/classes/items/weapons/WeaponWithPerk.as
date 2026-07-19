package classes.items.weapons
{
   import classes.Perk;
   import classes.PerkType;
   import classes.items.Equippable;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class WeaponWithPerk extends Weapon
   {
      
      public var storedPerk:Perk;
      
      public var playerPerkV4:Number;
      
      public var playerPerkV3:Number;
      
      public var playerPerkV2:Number;
      
      public var playerPerkV1:Number;
      
      public var playerPerk:PerkType;
      
      public function WeaponWithPerk(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Array = undefined, param6:Number = 0, param7:Number = 0, param8:String = undefined, param9:Array = undefined, param10:PerkType = undefined, param11:Number = 0, param12:Number = 0, param13:Number = 0, param14:Number = 0, param15:String = undefined)
      {
         if(param15 == null)
         {
            param15 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         playerPerkV4 = Number(Math.NaN);
         playerPerkV3 = Number(Math.NaN);
         playerPerkV2 = Number(Math.NaN);
         playerPerkV1 = Number(Math.NaN);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         playerPerk = param10;
         playerPerkV1 = param11;
         playerPerkV2 = param12;
         playerPerkV3 = param13;
         playerPerkV4 = param14;
         storedPerk = new Perk(param10,param11,param12,param13,param14);
      }
      
      override public function playerRemove() : Equippable
      {
         get_player().removePerk(playerPerk);
         return super.playerRemove();
      }
      
      override public function playerEquip() : Equippable
      {
         get_player().createPerk(playerPerk,playerPerkV1,playerPerkV2,playerPerkV3,playerPerkV4);
         return super.playerEquip();
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = super.get_description();
         return _loc1_ + ("\n特殊：" + playerPerk.get_name() + " - " + storedPerk.get_perkDesc());
      }
   }
}

