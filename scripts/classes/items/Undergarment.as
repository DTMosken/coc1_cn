package classes.items
{
   import classes.Player;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Undergarment extends Equippable
   {
      
      public static var TAILLEGWEARABLE:String = "TailLegWearable";
      
      public var _type:Number;
      
      public var _sexiness:int;
      
      public var _perk:String;
      
      public var _name:String;
      
      public var _armorDef:int;
      
      public function Undergarment(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:String = undefined, param8:int = 0, param9:int = 0, param10:String = undefined)
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         if(param10 == null)
         {
            param10 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _armorDef = 0;
         _sexiness = 0;
         _type = Number(Math.NaN);
         super(param1,param2,param4,param6,param7);
         _type = param5;
         _name = param3;
         _perk = param10;
         _sexiness = param8;
         _armorDef = param9;
      }
      
      override public function sourceString() : String
      {
         return get_name();
      }
      
      public function get_type() : Number
      {
         return _type;
      }
      
      public function get_sexiness() : int
      {
         return _sexiness;
      }
      
      public function get_perk() : String
      {
         return _perk;
      }
      
      override public function get_name() : String
      {
         return _name;
      }
      
      override public function get_headerName() : String
      {
         if(_headerName != "")
         {
            return _headerName;
         }
         return get_name();
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = Utils.cnName(_description);
         var _loc2_:int = 0;
         _loc1_ += "\n\n类型：内衣 ";
         if(get_type() == 0)
         {
            _loc1_ += "(上装)";
         }
         else if(get_type() == 1)
         {
            _loc1_ += "(下装)";
         }
         else if(get_type() == 2)
         {
            _loc1_ += "(全身)";
         }
         if(get_type() == 1)
         {
            _loc2_ = get_armorDef() - get_player().get_lowerGarment().get_armorDef();
         }
         else
         {
            _loc2_ = get_armorDef() - get_player().get_upperGarment().get_armorDef();
         }
         if(get_armorDef() > 0 || _loc2_ != 0)
         {
            _loc1_ += "\n防御：" + Std.string(get_armorDef());
         }
         _loc1_ += appendStatsDifference(_loc2_);
         if(get_type() == 1)
         {
            _loc2_ = get_sexiness() - get_player().get_lowerGarment().get_sexiness();
         }
         else
         {
            _loc2_ = get_sexiness() - get_player().get_upperGarment().get_sexiness();
         }
         if(get_sexiness() > 0 || _loc2_ != 0)
         {
            _loc1_ += "\n性感度: " + Std.string(get_sexiness());
         }
         _loc1_ += appendStatsDifference(_loc2_);
         _loc1_ += "\n基础价值: " + Std.string(get_value());
         _loc1_ += generateStatsTooltip();
         if(get_type() == 1 && get_perk() == "TailLegWearable" && get_player().hasTailInsteadOfLegs())
         {
            _loc1_ += "\n娜迦和美人鱼不受限制，可以穿着这种下半身内衣。";
         }
         return _loc1_;
      }
      
      public function get_armorDef() : int
      {
         return _armorDef;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_armor() == get_armors().VINARMR)
         {
            outputText("你试图穿上你的" + Utils.cnName(get_name()) + "，但当它压在你的藤蔓上的那一刻，一阵可怕的灼烧感传遍了你的[skinshort]。这种植物不喜欢被覆盖。");
            return false;
         }
         if(get_player().get_upperGarment() == get_undergarments().SEA_SHIRT)
         {
            get_player().get_upperGarment().removeText();
            return !get_undergarments().SEA_SHIRT.saveContent.bound;
         }
         if(!get_player().get_armor().get_supportsUndergarment())
         {
            outputText("当你穿着现在的衣服时，穿内衣会很尴尬。你应该考虑换一套衣服。你把它放回了物品栏。");
            return false;
         }
         if(get_type() == 1)
         {
            if(get_player().isBiped() || get_player().isGoo())
            {
               return true;
            }
            if(get_player().isTaur() || get_player().isDrider())
            {
               outputText("你的体型让你无法穿上任何形式的下半身内衣。你把它放回了物品栏。");
               return false;
            }
            if(get_player().hasTailInsteadOfLegs())
            {
               if(get_perk() != "TailLegWearable")
               {
                  outputText("你无法穿上这件内衣，因为它是为有两条腿的人设计的。你把它放回了物品栏。");
                  return false;
               }
               return true;
            }
         }
         return true;
      }
   }
}

