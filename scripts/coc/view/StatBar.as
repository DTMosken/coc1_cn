package coc.view
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class StatBar extends Block implements ThemeObserver
   {
      
      public static var init__:Boolean;
      
      public static var DEFAULT_OPTIONS:StatBarOptions;
      
      public var valueLabel:TextField;
      
      public var value:Number;
      
      public var showMax:Boolean;
      
      public var nameLabel:TextField;
      
      public var minValue:Number;
      
      public var minBar:BitmapDataSprite;
      
      public var maxValue:Number;
      
      public var bar:BitmapDataSprite;
      
      public var arrowUp:BitmapDataSprite;
      
      public var arrowDown:BitmapDataSprite;
      
      public var _gauge:BitmapDataSprite;
      
      public var _defaults:StatBarOptions;
      
      public var _bgBar:BitmapDataSprite;
      
      public function StatBar(param1:StatBarOptions = undefined)
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(Boot.skip_constructor)
         {
            return;
         }
         showMax = false;
         value = 0;
         maxValue = 0;
         minValue = 0;
         super();
         param1 = StatBar.merge(param1,StatBar.DEFAULT_OPTIONS);
         _defaults = param1;
         var _loc2_:Number = Number(param1.width);
         var _loc3_:Number = Number(param1.height);
         var _loc4_:Number = _loc3_ - 3;
         var _loc5_:Number = _loc2_ - _loc4_ - 2;
         if(!param1.hasBar)
         {
            _bgBar = null;
            bar = null;
            minBar = null;
            _gauge = null;
         }
         else
         {
            _loc6_ = 1;
            _loc7_ = _loc3_ * param1.barHeight;
            _loc8_ = _loc3_ - _loc7_;
            _bgBar = param1.bgColor == null ? null : addBitmapDataSprite(new BitmapDataSprite(null,null,false,_loc6_,_loc8_,_loc7_,_loc5_,false,"",param1.bgColor,false,param1.barAlpha,true));
            bar = addBitmapDataSprite(new BitmapDataSprite(null,null,false,_loc6_,_loc8_,_loc7_,0,false,"",param1.barColor,false,param1.barAlpha,true));
            minBar = !param1.hasMinBar ? null : addBitmapDataSprite(new BitmapDataSprite(null,null,false,_loc6_,_loc8_,_loc7_,0,false,"",param1.minBarColor,false,param1.barAlpha,true));
            _gauge = !param1.hasGauge ? null : addBitmapDataSprite(new BitmapDataSprite(null,StatsBarBottom,true,0,_loc3_ - 10,10,_loc5_ + 2,false,"",0,false,1,true));
            if(param1.hasShadow)
            {
               applyShadow();
            }
         }
         _loc6_ = param1.height / 28;
         nameLabel = addTextField(new TextFieldParameters(null,null,null,null,_loc5_,_loc3_ - 4 * _loc6_,6,4,new DefaultTextFormatParameters("Alibaba PuHuiTi 3 85 Bold",int(15 * _loc6_),null,null,null,null,null,null,null,null,null,null,null),null,null,null,null,null,null,null,null));
         valueLabel = addTextField(new TextFieldParameters(null,null,null,null,_loc5_,30 * _loc6_,0,_loc3_ - 30 * _loc6_,new DefaultTextFormatParameters("Alibaba PuHuiTi 3 85 Bold",int(22 * _loc6_),null,null,null,null,null,null,"right",null,null,null,null),null,null,null,null,null,null,null,null));
         arrowUp = addBitmapDataSprite(new BitmapDataSprite(null,ArrowUp,true,_loc2_ - _loc4_ + 2,1,_loc4_,_loc4_,true,"",0,false,1,false));
         arrowDown = addBitmapDataSprite(new BitmapDataSprite(null,ArrowDown,true,_loc2_ - _loc4_ + 2,1,_loc4_,_loc4_,true,"",0,false,1,false));
         set_width(param1.width);
         set_height(param1.height);
         set_minValue(param1.minValue);
         set_maxValue(param1.maxValue);
         set_value(param1.value);
         set_statName(param1.statName);
         set_showMax(param1.showMax);
         set_isUp(param1.isUp);
         set_isDown(param1.isDown);
         Theme.subscribe(this);
         refresh();
      }
      
      public static function factoryReset() : StatBarOptions
      {
         return new StatBarOptions(200,28,0,100,0,"",false,false,false,true,true,false,true,0.4,1,255,8421631,null);
      }
      
      public static function setDefaultOptions(param1:StatBarOptions) : void
      {
         StatBar.DEFAULT_OPTIONS = StatBar.merge(param1,StatBar.DEFAULT_OPTIONS);
      }
      
      public static function merge(param1:StatBarOptions, param2:StatBarOptions) : StatBarOptions
      {
         var _loc3_:Object = param1.width;
         var _loc4_:Object = param1.height;
         var _loc5_:Object = param1.minValue;
         var _loc6_:Object = param1.maxValue;
         var _loc7_:Object = param1.value;
         var _loc8_:String = param1.statName;
         var _loc9_:Object = param1.showMax;
         var _loc10_:Object = param1.isUp;
         var _loc11_:Object = param1.isDown;
         var _loc12_:Object = param1.hasGauge;
         var _loc13_:Object = param1.hasBar;
         var _loc14_:Object = param1.hasMinBar;
         var _loc15_:Object = param1.hasShadow;
         var _loc16_:Object = param1.barAlpha;
         var _loc17_:Object = param1.barHeight;
         var _loc18_:Object = param1.barColor;
         var _loc19_:Object = param1.minBarColor;
         var _loc20_:Object = param1.bgColor;
         return new StatBarOptions(_loc3_ != null ? _loc3_ : param2.width,_loc4_ != null ? _loc4_ : param2.height,_loc5_ != null ? _loc5_ : param2.minValue,_loc6_ != null ? _loc6_ : param2.maxValue,_loc7_ != null ? _loc7_ : param2.value,_loc8_ != null ? _loc8_ : param2.statName,_loc9_ != null ? _loc9_ : param2.showMax,_loc10_ != null ? _loc10_ : param2.isUp,_loc11_ != null ? _loc11_ : param2.isDown,_loc12_ != null ? _loc12_ : param2.hasGauge,_loc13_ != null ? _loc13_ : param2.hasBar,_loc14_ != null ? _loc14_ : param2.hasMinBar,_loc15_ != null ? _loc15_ : param2.hasShadow,_loc16_ != null ? _loc16_ : param2.barAlpha,_loc17_ != null ? _loc17_ : param2.barHeight,_loc18_ != null ? _loc18_ : param2.barColor,_loc19_ != null ? _loc19_ : param2.minBarColor,_loc20_ != null ? _loc20_ : param2.bgColor);
      }
      
      public static function resetDefaultOptions() : void
      {
         StatBar.DEFAULT_OPTIONS = StatBar.factoryReset();
      }
      
      public function update(param1:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null as String;
         var _loc2_:IMap = Theme.current.get_statbar();
         var _loc3_:* = _loc2_ != null ? ("default" in StringMap.reserved ? _loc2_.getReserved("default") : _loc2_.h["default"]) : null;
         var _loc4_:IMap = Theme.current.get_statbar();
         if(_loc4_ != null)
         {
            _loc6_ = get_statName();
            _loc5_ = _loc6_ in StringMap.reserved ? _loc4_.getReserved(_loc6_) : _loc4_.h[_loc6_];
         }
         else
         {
            _loc5_ = null;
         }
         if(_loc3_ != null)
         {
            setVals(_loc3_,true);
         }
         else
         {
            setVals({},true);
         }
         if(_loc5_ != null)
         {
            setVals(_loc5_);
         }
         if(_gauge != null)
         {
            _gauge.set_bitmap(Theme.current.get_statbarBottomBg());
         }
         arrowUp.set_bitmap(Theme.current.get_arrowUp());
         arrowDown.set_bitmap(Theme.current.get_arrowDown());
      }
      
      public function stepBarChange(param1:Number, param2:Number, param3:Timer, param4:TimerEvent) : void
      {
         set_value(param1 + (param2 - param1) / param3.repeatCount * param3.currentCount);
         var _loc5_:Boolean = param2 < param1;
         if(_loc5_ && value < param2 || !_loc5_ && value > param2)
         {
            param3.stop();
         }
         if(param3.currentCount >= param3.repeatCount)
         {
            set_value(param2);
         }
      }
      
      public function set_valueText(param1:String) : String
      {
         if(valueLabel != null)
         {
            valueLabel.text = param1;
         }
         return param1;
      }
      
      public function set_value(param1:Number) : Number
      {
         value = param1;
         renderValue();
         refresh();
         return param1;
      }
      
      public function set_statName(param1:String) : String
      {
         return nameLabel.text = param1;
      }
      
      public function set_showMax(param1:Boolean) : Boolean
      {
         showMax = param1;
         renderValue();
         return param1;
      }
      
      public function set_minValue(param1:Number) : Number
      {
         minValue = param1;
         refresh();
         return param1;
      }
      
      public function set_maxValue(param1:Number) : Number
      {
         maxValue = param1;
         if(showMax)
         {
            renderValue();
         }
         refresh();
         return param1;
      }
      
      public function set_isUp(param1:Boolean) : Boolean
      {
         arrowUp.visible = param1;
         if(param1)
         {
            arrowDown.visible = false;
         }
         return param1;
      }
      
      public function set_isDown(param1:Boolean) : Boolean
      {
         arrowDown.visible = param1;
         if(param1)
         {
            arrowUp.visible = false;
         }
         return param1;
      }
      
      public function setVals(param1:Object, param2:Boolean = false) : void
      {
         if(_bgBar != null)
         {
            if(param1.bgColor != null)
            {
               _bgBar.set_fillColor(Color.parseColorString(param1.bgColor));
            }
            else if(param2)
            {
               _bgBar.set_fillColor(_defaults.bgColor);
            }
         }
         if(bar != null)
         {
            if(param1.barColor != null)
            {
               bar.set_fillColor(Color.parseColorString(param1.barColor));
            }
            else if(param2)
            {
               bar.set_fillColor(_defaults.barColor);
            }
         }
         if(minBar != null)
         {
            if(param1.minbarColor != null)
            {
               minBar.set_fillColor(Color.parseColorString(param1.minbarColor));
            }
            else if(param2)
            {
               minBar.set_fillColor(_defaults.minBarColor);
            }
         }
         if(param1.fontColor != null)
         {
            valueLabel.textColor = Color.parseColorString(param1.fontColor);
            nameLabel.textColor = Color.parseColorString(param1.fontColor);
         }
         else if(param2)
         {
            valueLabel.textColor = Theme.current.get_sideTextColor();
            nameLabel.textColor = Theme.current.get_sideTextColor();
         }
      }
      
      public function renderValue() : void
      {
         set_valueText("" + Math.floor(value) + (showMax ? "/" + Math.floor(maxValue) : ""));
      }
      
      public function refresh() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(bar != null)
         {
            _loc1_ = Utils.boundFloat(0,value,maxValue);
            _loc2_ = get_width() - get_arrowSz() - 2;
            _loc3_ = _loc1_ * _loc2_;
            _loc4_ = _loc3_ / maxValue;
            bar.set_width(!Math.isNaN(maxValue) && maxValue > 0 ? Utils.boundFloat(0,value,maxValue) * (get_width() - get_arrowSz() - 2) / maxValue : 0);
         }
         if(minBar != null)
         {
            minBar.set_width(maxValue > 0 ? Utils.boundFloat(0,minValue,maxValue) * (get_width() - get_arrowSz() - 2) / maxValue : 0);
         }
      }
      
      public function get_valueText() : String
      {
         var _loc1_:TextField = valueLabel;
         var _loc2_:String = _loc1_ != null ? _loc1_.text : null;
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         return Std.string(value);
      }
      
      public function get_statName() : String
      {
         return nameLabel.text;
      }
      
      public function get_isUp() : Boolean
      {
         return arrowUp.visible;
      }
      
      public function get_isDown() : Boolean
      {
         return arrowDown.visible;
      }
      
      public function get_arrowSz() : Number
      {
         return get_height() - 3;
      }
      
      public function animateChange(param1:Number) : void
      {
         var timer1:Timer;
         var newValue1:Number;
         var oldValue:Number;
         var _g:StatBar;
         if(!KGAMECLASS.kGAMECLASS.get_animateStatBars())
         {
            set_value(param1);
            return;
         }
         var _loc2_:Timer = new Timer(32,30);
         _g = this;
         oldValue = value;
         newValue1 = param1;
         timer1 = _loc2_;
         _loc2_.addEventListener(TimerEvent.TIMER,function(param1:TimerEvent):void
         {
            _g.stepBarChange(oldValue,newValue1,timer1,param1);
         });
         _loc2_.start();
      }
   }
}

