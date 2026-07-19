package classes.items
{
   import classes.Bonus;
   import classes.BonusDerivedStats;
   import classes.CoC_Settings;
   import classes.Creature;
   import classes.ItemType;
   import classes.MainViewManager;
   import classes.Player;
   import classes._BonusDerivedStats.BonusStat_Impl_;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   import haxe.ds.StringMap;
   import haxe.iterators.MapKeyValueIterator;
   
   public class Useable extends ItemType
   {
      
      public var invUseOnly:Boolean;
      
      public function Useable(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:Number = 0, param5:String = undefined)
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
         if(param5 == null)
         {
            param5 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         invUseOnly = false;
         super(param1,param2,param3,param4,param5);
      }
      
      public function useText() : void
      {
      }
      
      public function useItem() : Boolean
      {
         CoC_Settings.errorAMC("Useable","useItem",get_id());
         return false;
      }
      
      override public function set_description(param1:String) : String
      {
         return _description = param1;
      }
      
      public function onUse() : void
      {
      }
      
      override public function get_description() : String
      {
         var _loc1_:String = Utils.cnName(_description);
         _loc1_ += "\n\n类型：";
         if(get_shortName() == "Condom" || get_shortName() == "GldStat")
         {
            _loc1_ += "杂项";
         }
         else if(get_shortName() == "Debug Wand")
         {
            _loc1_ += "杂项（作弊物品）";
         }
         else
         {
            _loc1_ += "材料";
         }
         _loc1_ += "\n基础价值：" + Std.string(get_value());
         return _loc1_ + generateStatsTooltip();
      }
      
      public function generateStatsTooltip() : String
      {
         var determineColor:Function;
         var badColor:String;
         var goodColor:String;
         var _loc4_:* = null;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Bonus;
         var _loc7_:Number = NaN;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         goodColor = get_mainViewManager().colorHpPlus();
         badColor = get_mainViewManager().colorHpMinus();
         determineColor = function(param1:String, param2:Number, param3:Number):String
         {
            if(Boolean(BonusDerivedStats.goodNegatives.contains(BonusStat_Impl_.additive(param1))))
            {
               if(param3 < param2)
               {
                  return goodColor;
               }
               return badColor;
            }
            if(param3 >= param2)
            {
               return goodColor;
            }
            return badColor;
         };
         var _loc1_:String = "";
         var _loc2_:Boolean = false;
         if(host == null)
         {
            host = get_player();
            _loc2_ = true;
         }
         var _loc3_:* = new MapKeyValueIterator(bonusStats.statArray);
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            _loc5_ = _loc4_.key;
            _loc6_ = _loc4_.value;
            if(!(_loc6_ == null || !_loc6_.visible))
            {
               _loc7_ = NumberFunc_Impl_.resolve(_loc6_.value);
               if(_loc5_ == BonusStat_Impl_.multiplicative(_loc5_))
               {
                  _loc1_ += "\n[b:" + BonusStat_Impl_.additive(_loc5_) + ": ]<font color=\"" + determineColor(_loc5_,1,_loc7_) + "\">x" + int(Math.round(_loc7_ * 100)) + "%</font>";
               }
               else if(_loc7_ != 0)
               {
                  _loc8_ = _loc7_ > 0 ? "+" : "";
                  _loc9_ = Boolean(BonusDerivedStats.percentageAdditions.contains(_loc5_)) ? "%" : "";
                  _loc1_ += "\n[b:" + _loc5_ + ": ]<font color=\"" + determineColor(_loc5_,0,_loc7_) + "\">" + _loc8_ + _loc7_ + _loc9_ + "</font>";
               }
            }
         }
         if(_loc2_)
         {
            host = null;
         }
         return _loc1_;
      }
      
      public function canUse() : Boolean
      {
         return true;
      }
   }
}

