package classes.items
{
   import classes.Player;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Shield extends Equippable
   {
      
      public static var WEIGHT_LIGHT:String = "Light";
      
      public static var WEIGHT_MEDIUM:String = "Medium";
      
      public static var WEIGHT_HEAVY:String = "Heavy";
      
      public static var PERK_ABSORPTION:String = "吸收";
      
      public var _weight:String;
      
      public var _perk:String;
      
      public var _name:String;
      
      public var _block:Number;
      
      public function Shield(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:String = undefined, param8:String = undefined)
      {
         if(param8 == null)
         {
            param8 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _weight = "Medium";
         _block = Number(Math.NaN);
         super(param1,param2,param4,param6,param7);
         _name = param3;
         _block = param5;
         _perk = param8;
      }
      
      public function set_weightCategory(param1:String) : String
      {
         return _weight = param1;
      }
      
      public function get_weightCategory() : String
      {
         return _weight;
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
         var _loc1_:String = Utils.cnName(_description);
         var _loc2_:int = 0;
         _loc1_ += "\n\n类型：盾牌";
         _loc1_ += "\n格挡：" + Std.string(get_block());
         _loc2_ = int(get_block() - get_player().get_shield().get_block());
         if(_loc2_ > 0)
         {
            _loc1_ += " (<font color=\"#00d000\">+" + Std.string(Math.abs(_loc2_)) + "</font>)";
         }
         else if(_loc2_ < 0)
         {
            _loc1_ += " (<font color=\"#d00000\">-" + Std.string(Math.abs(_loc2_)) + "</font>)";
         }
         _loc1_ += "\n基础价值：" + Std.string(get_value());
         return _loc1_ + generateStatsTooltip();
      }
      
      public function get_block() : Number
      {
         return _block;
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
      
      override public function canUse() : Boolean
      {
         if(get_player().get_weapon().isTwoHanded())
         {
            outputText("你当前的武器需要双手握持。在装备此盾牌前，请先卸下当前武器或切换为单手武器。");
            return false;
         }
         return true;
      }
   }
}

