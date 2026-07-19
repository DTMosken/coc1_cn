package classes.items
{
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Jewelry extends Equippable
   {
      
      public var _perk:String;
      
      public var _name:String;
      
      public var _effectMagnitude:Number;
      
      public var _effectId:Number;
      
      public function Jewelry(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:String = undefined, param9:String = undefined, param10:String = undefined)
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
         if(param9 == null)
         {
            param9 = "";
         }
         if(param10 == null)
         {
            param10 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _effectMagnitude = Number(Math.NaN);
         _effectId = Number(Math.NaN);
         super(param1,param2,param4,param7,param8);
         _name = param3;
         _effectId = param5;
         _effectMagnitude = param6;
         _perk = param10;
      }
      
      override public function sourceString() : String
      {
         return get_name();
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
      
      public function get_effectMagnitude() : Number
      {
         return _effectMagnitude;
      }
      
      public function get_effectId() : Number
      {
         return _effectId;
      }
      
      override public function get_description() : String
      {
         var _loc2_:Number = NaN;
         var _loc1_:String = Utils.cnName(_description);
         _loc1_ += "\n\n类型：戒指 ";
         if(_effectId > 0)
         {
            _loc1_ += "\n特殊效果：";
            _loc2_ = _effectId;
            if(_loc2_ == 1)
            {
               if(_effectMagnitude >= 0)
               {
                  _loc1_ += "最低欲望增加" + _effectMagnitude + "。";
               }
               else
               {
                  _loc1_ += "最低欲望减少" + -_effectMagnitude + "。";
               }
            }
            else if(_loc2_ == 2)
            {
               _loc1_ += "精液产量增加" + _effectMagnitude + "%，生育率增加" + _effectMagnitude + "。";
            }
            else if(_loc2_ == 3)
            {
               _loc1_ += "暴击率增加" + _effectMagnitude + "%。";
            }
            else if(_loc2_ == 4)
            {
               _loc1_ += "每回合恢复" + _effectMagnitude + "点生命值。非战斗状态下效果翻倍。";
            }
            else if(_loc2_ == 5)
            {
               _loc1_ += "最大生命值增加" + _effectMagnitude + "。";
            }
            else if(_loc2_ == 6)
            {
               _loc1_ += "攻击力增加" + _effectMagnitude + "%。";
            }
            else if(_loc2_ == 8)
            {
               _loc1_ += "随着时间推移，缓慢降低佩戴者的腐化值。最低性欲减少 " + _effectMagnitude + "。";
            }
            else if(_loc2_ == 9)
            {
               _loc1_ += "随着时间推移，缓慢腐化佩戴者。";
            }
            else if(_loc2_ == 12)
            {
               _loc1_ += "增加流血持续时间。允许你的流血攻击影响免疫流血的敌人。";
            }
            else if(_loc2_ == 13)
            {
               _loc1_ += "闪避率增加20%。\n暴击率增加15%。\n生命值减少40%。";
            }
            else
            {
               _loc1_ += "ERROR";
            }
         }
         _loc1_ += "\n基础价值：" + Std.string(get_value());
         return _loc1_ + generateStatsTooltip();
      }
      
      override public function getMaxStackSize() : int
      {
         return 1;
      }
   }
}

