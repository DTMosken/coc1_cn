package classes.items.armors
{
   import classes.PerkLib;
   import classes.PerkType;
   import classes.Player;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.Equippable;
   import flash.Boot;
   
   public class ArmorWithPerk extends Armor
   {
      
      public var playerPerkV4:Number;
      
      public var playerPerkV3:Number;
      
      public var playerPerkV2:Number;
      
      public var playerPerkV1:Number;
      
      public var playerPerk2V4:Number;
      
      public var playerPerk2V3:Number;
      
      public var playerPerk2V2:Number;
      
      public var playerPerk2V1:Number;
      
      public var playerPerk2:PerkType;
      
      public var playerPerk:PerkType;
      
      public function ArmorWithPerk(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:String = undefined, param8:String = undefined, param9:PerkType = undefined, param10:Number = 0, param11:Number = 0, param12:Number = 0, param13:Number = 0, param14:String = undefined, param15:PerkType = undefined, param16:Number = 0, param17:Number = 0, param18:Number = 0, param19:Number = 0, param20:String = undefined, param21:Boolean = false, param22:Boolean = true)
      {
         if(param14 == null)
         {
            param14 = "";
         }
         if(param20 == null)
         {
            param20 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         playerPerk2V4 = Number(Math.NaN);
         playerPerk2V3 = Number(Math.NaN);
         playerPerk2V2 = Number(Math.NaN);
         playerPerk2V1 = Number(Math.NaN);
         playerPerkV4 = Number(Math.NaN);
         playerPerkV3 = Number(Math.NaN);
         playerPerkV2 = Number(Math.NaN);
         playerPerkV1 = Number(Math.NaN);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param21,param22);
         playerPerk = param9;
         playerPerkV1 = param10;
         playerPerkV2 = param11;
         playerPerkV3 = param12;
         playerPerkV4 = param13;
         playerPerk2 = param15;
         playerPerk2V1 = param16;
         playerPerk2V2 = param17;
         playerPerk2V3 = param18;
         playerPerk2V4 = param19;
      }
      
      override public function playerRemove() : Equippable
      {
         get_player().removePerk(playerPerk);
         if(playerPerk2 != null)
         {
            get_player().removePerk(playerPerk2);
         }
         return super.playerRemove();
      }
      
      override public function playerEquip() : Equippable
      {
         get_player().createPerk(playerPerk,playerPerkV1,playerPerkV2,playerPerkV3,playerPerkV4);
         if(playerPerk2 != null)
         {
            get_player().createPerk(playerPerk2,playerPerk2V1,playerPerk2V2,playerPerk2V3,playerPerk2V4);
         }
         return super.playerEquip();
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = super.get_description();
         _loc1_ += "\n特殊：" + Utils.cnName(playerPerk.get_name());
         if(playerPerk == PerkLib.WizardsEndurance)
         {
            _loc1_ += " (-" + playerPerkV1 + "% 法术消耗)";
         }
         else if(playerPerkV1 > 0)
         {
            _loc1_ += " (强度: " + playerPerkV1 + ")";
         }
         if(playerPerk2 != null)
         {
            _loc1_ += "\n" + playerPerk2.get_name();
            if(playerPerk2 == PerkLib.WizardsEndurance)
            {
               _loc1_ += " (-" + playerPerk2V1 + "% 法术消耗)";
            }
            else if(playerPerk2V1 > 0)
            {
               _loc1_ += " (强度: " + playerPerk2V1 + ")";
            }
         }
         return _loc1_;
      }
   }
}

