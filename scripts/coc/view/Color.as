package coc.view
{
   import classes.internals.Utils;
   import coc.view._Color.HSLColor;
   
   public class Color
   {
      
      public static var INVALID_COLOR:uint = 32375022;
      
      public function Color()
      {
      }
      
      public static function fromArgb(param1:uint, param2:uint, param3:uint, param4:uint) : uint
      {
         return uint((param1 & 0xFF) << 24) | uint((param2 & 0xFF) << 16) | uint((param3 & 0xFF) << 8) | param4 & 0xFF;
      }
      
      public static function fromRgb(param1:uint, param2:uint, param3:uint) : uint
      {
         return uint((param1 & 0xFF) << 16) | uint((param2 & 0xFF) << 8) | param3 & 0xFF;
      }
      
      public static function fromArgbFloat(param1:Number, param2:Number, param3:Number, param4:Number) : uint
      {
         return Color.fromArgb(int(param1 * 255),int(param2 * 255),int(param3 * 255),int(param4 * 255));
      }
      
      public static function fromRgbFloat(param1:Number, param2:Number, param3:Number) : uint
      {
         return Color.fromRgb(int(param1 * 255),int(param2 * 255),int(param3 * 255));
      }
      
      public static function parseColorString(param1:String, param2:Boolean = false) : uint
      {
         var _loc3_:uint = 0;
         var _loc8_:uint = 0;
         var _loc4_:EReg = new EReg("^(?:0x|\\$|#)([a-fA-F0-9]{8})$","");
         var _loc5_:EReg = new EReg("^(?:0x|\\$|#)([a-fA-F0-9]{6})$","");
         var _loc6_:EReg = new EReg("^(?:0x|\\$|#)([a-fA-F0-9]{3})$","");
         var _loc7_:EReg = new EReg("^hsl\\((\\d+),(\\d+),(\\d+)\\)$","");
         if(_loc4_.match(param1))
         {
            _loc3_ = uint(Std.parseInt("0x" + _loc4_.matched(1)));
            if(param2)
            {
               return _loc3_;
            }
            return _loc3_ & 0xFFFFFF;
         }
         if(_loc5_.match(param1))
         {
            _loc3_ = uint(Std.parseInt("0x" + _loc5_.matched(1)));
         }
         else if(_loc6_.match(param1))
         {
            _loc8_ = uint(Std.parseInt("0x" + _loc6_.matched(1)));
            _loc3_ = uint(uint((_loc8_ & 0x0F00) << 3) | uint((_loc8_ & 0x0F00) << 2) | uint((_loc8_ & 0xF0) << 2) | uint((_loc8_ & 0xF0) << 1) | uint((_loc8_ & 0x0F) << 1) | _loc8_ & 0x0F);
         }
         else
         {
            if(!_loc7_.match(param1))
            {
               if(Std.parseInt(param1) != null)
               {
                  return Std.parseInt(param1);
               }
               return 32375022;
            }
            _loc3_ = Color.fromHsl(new HSLColor(Std.parseFloat(_loc7_.matched(1)),Std.parseFloat(_loc7_.matched(2)),Std.parseFloat(_loc7_.matched(3)),null));
         }
         if(param2)
         {
            return _loc3_ | -16777216;
         }
         return _loc3_;
      }
      
      public static function toHsl(param1:uint) : HSLColor
      {
         var _loc11_:Number = NaN;
         var _loc2_:Number = (uint(param1 >>> 24) & 0xFF) / 255;
         var _loc3_:Number = (uint(param1 >>> 16) & 0xFF) / 255;
         var _loc4_:Number = (uint(param1 >>> 8) & 0xFF) / 255;
         var _loc5_:Number = (uint(param1 >>> 0) & 0xFF) / 255;
         var _loc6_:Number = Math.max(_loc3_,Math.max(_loc4_,_loc5_));
         var _loc7_:Number = Math.min(_loc3_,Math.min(_loc4_,_loc5_));
         var _loc8_:Number = Number(Math.NaN);
         var _loc9_:Number = Number(Math.NaN);
         var _loc10_:Number = (_loc6_ + _loc7_) / 2;
         if(_loc6_ == _loc7_)
         {
            _loc9_ = 0;
            _loc8_ = _loc9_;
         }
         else
         {
            _loc11_ = _loc6_ - _loc7_;
            _loc9_ = _loc10_ > 0.5 ? _loc11_ / (2 - _loc6_ - _loc7_) : _loc11_ / (_loc6_ + _loc7_);
            if(_loc6_ == _loc3_)
            {
               _loc8_ = (_loc4_ - _loc5_) / _loc11_ + (_loc4_ < _loc5_ ? 6 : 0);
            }
            else if(_loc6_ == _loc4_)
            {
               _loc8_ = (_loc5_ - _loc3_) / _loc11_ + 2;
            }
            else if(_loc6_ == _loc5_)
            {
               _loc8_ = (_loc3_ - _loc4_) / _loc11_ + 4;
            }
            _loc8_ /= 6;
         }
         return new HSLColor(_loc8_ * 360,_loc9_ * 100,_loc10_ * 100,_loc2_ / 255);
      }
      
      public static function fromHsl(param1:HSLColor) : uint
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc5_:Number = Utils.boundFloat(0,param1.h / 360,1);
         var _loc6_:Number = Utils.boundFloat(0,param1.s / 100,1);
         var _loc7_:Number = Utils.boundFloat(0,param1.l / 100,1);
         if(_loc6_ == 0)
         {
            _loc4_ = _loc7_;
            _loc3_ = _loc4_;
            _loc2_ = _loc3_;
         }
         else
         {
            _loc8_ = _loc7_ < 0.5 ? _loc7_ * (1 + _loc6_) : _loc7_ + _loc6_ - _loc7_ * _loc6_;
            _loc9_ = 2 * _loc7_ - _loc8_;
            _loc2_ = Color.hue2rgb(_loc9_,_loc8_,_loc5_ + 0.3333333333333333);
            _loc3_ = Color.hue2rgb(_loc9_,_loc8_,_loc5_);
            _loc4_ = Color.hue2rgb(_loc9_,_loc8_,_loc5_ - 0.3333333333333333);
         }
         if(param1.a != null)
         {
            return Color.fromArgbFloat(param1.a,_loc2_,_loc3_,_loc4_);
         }
         return Color.fromRgbFloat(_loc2_,_loc3_,_loc4_);
      }
      
      public static function hue2rgb(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param3 < 0)
         {
            param3++;
         }
         if(param3 > 1)
         {
            param3--;
         }
         if(param3 < 0.16666666666666666)
         {
            return param1 + (param2 - param1) * 6 * param3;
         }
         if(param3 < 0.5)
         {
            return param2;
         }
         if(param3 < 0.6666666666666666)
         {
            return param1 + (param2 - param1) * (0.6666666666666666 - param3) * 6;
         }
         return param1;
      }
      
      public static function darken(param1:uint, param2:Number = 10) : uint
      {
         var _loc3_:HSLColor = Color.toHsl(param1);
         _loc3_.l = Utils.boundFloat(0,_loc3_.l - param2,100);
         return Color.fromHsl(_loc3_);
      }
      
      public static function lighten(param1:uint, param2:Number = 10) : uint
      {
         var _loc3_:HSLColor = Color.toHsl(param1);
         _loc3_.l = Utils.boundFloat(0,_loc3_.l + param2,100);
         return Color.fromHsl(_loc3_);
      }
   }
}

