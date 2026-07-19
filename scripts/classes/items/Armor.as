package classes.items
{
   import classes.PerkLib;
   import classes.Player;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Armor extends Equippable
   {
      
      public static var WEIGHT_LIGHT:String = "Light";
      
      public static var WEIGHT_MEDIUM:String = "Medium";
      
      public static var WEIGHT_HEAVY:String = "Heavy";
      
      public var _tier:int;
      
      public var _supportsUndergarment:Boolean;
      
      public var _supportsBulge:Boolean;
      
      public var _perk:String;
      
      public var _name:String;
      
      public var _def:Number;
      
      public function Armor(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:String = undefined, param8:String = undefined, param9:Boolean = false, param10:Boolean = true)
      {
         if(param8 == null)
         {
            param8 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _tier = 0;
         _supportsUndergarment = false;
         _supportsBulge = false;
         _def = Number(Math.NaN);
         super(param1,param2,param4,param6,param7);
         _name = param3;
         _def = param5;
         _perk = param8;
         _supportsBulge = param9;
         _supportsUndergarment = param10;
      }
      
      override public function sourceString() : String
      {
         return get_name();
      }
      
      override public function playerRemove() : Equippable
      {
         get_player().removePerk(PerkLib.BulgeArmor);
         if(get_player().get_modArmorName().length > 0)
         {
            get_player().set_modArmorName("");
         }
         return super.playerRemove();
      }
      
      override public function playerEquip() : Equippable
      {
         get_player().addToWornClothesArray(this);
         return super.playerEquip();
      }
      
      public function get_supportsUndergarment() : Boolean
      {
         return _supportsUndergarment;
      }
      
      public function get_supportsBulge() : Boolean
      {
         if(_supportsBulge)
         {
            return get_player().get_modArmorName() == "";
         }
         return false;
      }
      
      public function get_perk() : String
      {
         return _perk;
      }
      
      override public function get_name() : String
      {
         return _name;
      }
      
      override public function get_description() : String
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as String;
         var _loc1_:String = Utils.cnName(_description);
         _loc1_ += "\n\n类型：";
         if(get_perk() == "Light" || get_perk() == "Medium" || get_perk() == "Heavy")
         {
            _loc3_ = get_perk();
            if(_loc3_ == "Heavy")
            {
               _loc2_ = "重甲";
            }
            else if(_loc3_ == "Light")
            {
               _loc2_ = "轻甲";
            }
            else if(_loc3_ == "Medium")
            {
               _loc2_ = "中甲";
            }
            else
            {
               _loc2_ = get_perk();
            }
            _loc1_ += "护甲（" + _loc2_ + "）";
         }
         else if(get_perk() == "Adornment")
         {
            _loc1_ += "饰品";
         }
         else
         {
            _loc1_ += "服装";
         }
         _loc1_ += "\n防御力：" + Std.string(get_def());
         _loc1_ += appendStatsDifference(int(get_def() - get_player().get_armor().get_def()));
         _loc1_ += "\n基础价值：" + Std.string(get_value());
         return _loc1_ + generateStatsTooltip();
      }
      
      public function get_def() : Number
      {
         return _def + _tier;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
      
      override public function canUse() : Boolean
      {
         var _loc1_:* = null as String;
         var _loc2_:Boolean = false;
         if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
         {
            if(this == get_armors().GOOARMR)
            {
               outputText((get_armors().VINARMR.saveContent.armorStage > 2 ? "[say: 哇哦，]蓝宝石史莱姆举起双手说道，[say: 我可不确定我想躺在荆棘床上。]荆棘怎么会让无定形的史莱姆感到如此不适是个谜，但她看起来确实很反感。[say: 还有，这]" : "[say: 这]") + "些藤蔓不会开始吸干我所有的体液吧？]瓦莱里娅担忧地问道。你觉得这些藤蔓并没有杀死你，所以应该没那么糟。[say: 你又不是史莱姆，搭档，你不是由纯粹的粘液营养组成的，不会被什么植物寄生虫吞噬。]");
               outputText("[pg]你唯一能做的就是叹口气，接受她的拒绝。");
            }
            else
            {
               outputText("你试图穿上你的" + Utils.cnName(get_name()) + "，但就在它压在你的藤蔓上的那一刻，一阵可怕的灼烧感传遍了你的[skinshort]。这种植物不喜欢被覆盖。");
            }
            return false;
         }
         if(get_supportsUndergarment() == false && (get_player().get_upperGarment() != UndergarmentLib.NOTHING || get_player().get_lowerGarment() != UndergarmentLib.NOTHING))
         {
            _loc1_ = "";
            _loc2_ = false;
            _loc1_ += "当你目前穿着" + Utils.cnName(get_longName()) + "时，穿上";
            if(get_player().get_upperGarment() != UndergarmentLib.NOTHING)
            {
               _loc1_ += Utils.cnName(get_player().get_upperGarment().get_longName());
               _loc2_ = true;
            }
            if(get_player().get_lowerGarment() != UndergarmentLib.NOTHING)
            {
               if(_loc2_)
               {
                  _loc1_ += "和";
               }
               _loc1_ += Utils.cnName(get_player().get_lowerGarment().get_longName());
            }
            _loc1_ += "会很尴尬。你应该考虑把它们脱下来。你把它放回了物品栏。";
            outputText(_loc1_);
            return false;
         }
         return Boolean(super.canUse());
      }
   }
}

