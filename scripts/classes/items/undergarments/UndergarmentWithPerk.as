package classes.items.undergarments
{
   import classes.PerkLib;
   import classes.PerkType;
   import classes.Player;
   import classes.items.Equippable;
   import classes.items.Undergarment;
   import flash.Boot;
   
   public class UndergarmentWithPerk extends Undergarment
   {
      
      public var playerPerkV4:Number;
      
      public var playerPerkV3:Number;
      
      public var playerPerkV2:Number;
      
      public var playerPerkV1:Number;
      
      public var playerPerk:PerkType;
      
      public function UndergarmentWithPerk(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:String = undefined, param8:int = 0, param9:int = 0, param10:PerkType = undefined, param11:Number = 0, param12:Number = 0, param13:Number = 0, param14:Number = 0, param15:String = undefined, param16:String = undefined)
      {
         if(param15 == null)
         {
            param15 = "";
         }
         if(param16 == null)
         {
            param16 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         playerPerkV4 = Number(Math.NaN);
         playerPerkV3 = Number(Math.NaN);
         playerPerkV2 = Number(Math.NaN);
         playerPerkV1 = Number(Math.NaN);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param16);
         playerPerk = param10;
         playerPerkV1 = param11;
         playerPerkV2 = param12;
         playerPerkV3 = param13;
         playerPerkV4 = param14;
      }
      
      override public function removeText() : void
      {
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
         _loc1_ += "\n特殊效果：" + playerPerk.get_name();
         if(playerPerk == PerkLib.WizardsEndurance)
         {
            _loc1_ += " (-" + playerPerkV1 + "% 法术消耗)";
         }
         else if(playerPerkV1 > 0)
         {
            _loc1_ += " (强度：" + playerPerkV1 + ")";
         }
         return _loc1_;
      }
   }
}

